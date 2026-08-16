import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_signin_model.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/signin_usecase.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.signinUsecase) : super(LoginInitial());
  final SigninUsecase signinUsecase;
  Future<void> login(UserSigninModel params) async {
    emit(LoginLoading());
    try {
      Either returnedData = await signinUsecase.call(params: params);
      returnedData.fold(
        (message) {
          emit(LoginFailure(errMessage: message));
        },
        (data) {
          emit(LoginSuccess());
        },
      );
    } catch (e) {
      emit(LoginFailure(errMessage: e.toString()));
    }
  }
}
