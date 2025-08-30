import 'package:bloc/bloc.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/is_logged_in_usecase.dart';
import 'package:meta/meta.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void AppStarted() async {
    await Future.delayed(const Duration(seconds: 3));
    var isLoggedIN = await getIt<IsLoggedInUsecase>().call();
    if (isLoggedIN) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
