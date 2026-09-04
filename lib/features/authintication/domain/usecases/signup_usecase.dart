import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/authintication/domain/entities/sign_up_entity.dart';
import 'package:e_commerce_clot/features/authintication/domain/repo/user_auth_repo.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';

class SignUpUsecase implements Usecase<Either, SignUpEntity> {
  @override
  Future<Either> call({SignUpEntity? params}) async {
    return await getIt<UserAuthRepo>().signup(params!);
  }
}
