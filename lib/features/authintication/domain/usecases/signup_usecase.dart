import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_model.dart';
import 'package:e_commerce_clot/features/authintication/domain/repo/user_auth_repo.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';

class SignupUsecase implements Usecase<Either, UserModel> {
  @override
  Future<Either> call({UserModel? params}) async {
    return await getIt<UserAuthRepo>().signup(params!);
  }
}
