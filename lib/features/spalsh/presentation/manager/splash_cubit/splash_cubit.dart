import 'package:bloc/bloc.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/check_email_verification_usecase.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/is_logged_in_usecase.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  Future<void> appStarted() async {
    await Future.delayed(const Duration(seconds: 3));

    final isLoggedIn = await getIt<IsLoggedInUsecase>().call();

    if (!isLoggedIn) {
      emit(UnAuthenticated());
      return;
    }

    final verificationResult =
        await getIt<CheckEmailVerificationUsecase>().call();

    verificationResult.fold(
      (_) {
        emit(EmailNotVerified());
      },
      (isVerified) {
        if (isVerified == true) {
          emit(Authenticated());
        } else {
          emit(EmailNotVerified());
        }
      },
    );
  }
}
