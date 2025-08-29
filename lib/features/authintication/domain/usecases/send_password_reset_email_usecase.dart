import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';
import 'package:e_commerce_clot/features/authintication/domain/repo/user_auth_repo.dart';

class SendPasswordResetEmailUsecase extends Usecase<Either, String> {
  @override
  Future <Either> call({String? params}) {
    return getIt<UserAuthRepo>().sendPasswordResetEmail(params!);
  }
}
