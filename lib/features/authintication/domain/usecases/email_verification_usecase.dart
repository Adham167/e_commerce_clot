import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';
import 'package:e_commerce_clot/features/authintication/domain/repo/user_auth_repo.dart';

class EmailVerificationUsecase implements Usecase<Either, void> {
  @override
  Future<Either> call({void params}) async {
    return await getIt<UserAuthRepo>().sendEmailVerification();
  }
}