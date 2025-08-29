import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';
import 'package:e_commerce_clot/features/authintication/domain/repo/user_auth_repo.dart';

class IsLoggedInUsecase extends Usecase<bool,dynamic>{
  @override
  Future<bool> call({params}) async{
    return await getIt<UserAuthRepo>().isLoggedIn();
  }
}