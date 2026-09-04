import 'package:bloc/bloc.dart';
import 'package:e_commerce_clot/features/authintication/domain/entities/sign_up_entity.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/signup_usecase.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpUsecase) : super(SignUpInitial());
  final SignUpUsecase signUpUsecase;
  Future<void> signUp(SignUpEntity user) async {
    emit(SignUpLoading());

    try {
      final result = await signUpUsecase.call(params: user);

      result.fold(
        (message) {
          emit(SignUpFailure(errMessage: message));
        },
        (_) {
          emit(SignUpSuccess());
        },
      );
    } catch (e) {
      emit(SignUpFailure(errMessage: e.toString()));
    }
  }
}
