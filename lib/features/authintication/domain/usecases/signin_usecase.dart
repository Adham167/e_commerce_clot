import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_signin_model.dart';
import 'package:e_commerce_clot/features/authintication/domain/repo/user_auth_repo.dart';

class SigninUsecase extends Usecase<Either, UserSigninModel> {
  @override
  Future<Either> call({UserSigninModel? params}) async {
    return await getIt<UserAuthRepo>().signin(params!);
  }
}
