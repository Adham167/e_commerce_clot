import 'package:bloc/bloc.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/log_out_usecase.dart';
import 'package:meta/meta.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());
  void logout() async {
    emit(LogoutLoading());

    final result = await getIt<LogOutUsecase>().call();
    result.fold(
      (failure) => emit(LogoutFailure(errMessage: failure)),

      (success) => emit(LogoutSuccess()),
    );
  }
}
