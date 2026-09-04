import 'package:bloc/bloc.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/check_email_verification_usecase.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/email_verification_usecase.dart';
import 'package:meta/meta.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit(
    this.emailVerificationUsecase,
    this.checkEmailVerificationUsecase,
  ) : super(EmailVerificationInitial());

  final EmailVerificationUsecase emailVerificationUsecase;
  final CheckEmailVerificationUsecase checkEmailVerificationUsecase;

  Future<void> resendEmail() async {
    emit(EmailVerificationResending());

    try {
      final result = await emailVerificationUsecase.call();

      result.fold(
        (message) {
          emit(EmailVerificationFailure(message: message));
        },
        (_) {
          emit(EmailVerificationSent());
        },
      );
    } catch (e) {
      emit(EmailVerificationFailure(message: e.toString()));
    }
  }

  Future<void> checkVerification() async {
    emit(EmailVerificationChecking());

    try {
      final result = await checkEmailVerificationUsecase.call();

      result.fold(
        (message) {
          emit(EmailVerificationFailure(message: message));
        },
        (isVerified) {
          if (isVerified == true) {
            emit(EmailVerified());
          } else {
            emit(EmailNotVerified());
          }
        },
      );
    } catch (e) {
      emit(EmailVerificationFailure(message: e.toString()));
    }
  }
}
