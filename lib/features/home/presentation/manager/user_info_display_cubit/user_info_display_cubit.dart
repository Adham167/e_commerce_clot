import 'package:bloc/bloc.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/entities/user_entity.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/get_user_usecase.dart';
import 'package:meta/meta.dart';

part 'user_info_display_state.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoDisplayLoading());

  void displayUserInfo() async {
    var returnedData = await getIt<GetUserUsecase>().call();
    returnedData.fold(
      (error) {
        emit(UserInfoDisplayFailure());
      },
      (data) {
        emit(UserInfoDisplayLoaded(userEntity: data));
      },
    );
  }
}
