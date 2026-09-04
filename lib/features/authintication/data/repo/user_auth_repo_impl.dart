import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_signin_model.dart';
import 'package:e_commerce_clot/features/authintication/domain/entities/sign_up_entity.dart';
import 'package:e_commerce_clot/features/authintication/domain/repo/user_auth_repo.dart';
import 'package:e_commerce_clot/features/authintication/domain/repo/auth_firebase_service.dart';
import 'package:e_commerce_clot/features/home/data/models/user_data_model.dart';

class UserAuthRepoImpl extends UserAuthRepo {
  @override
  Future<Either> signup(SignUpEntity user) async {
    return await getIt<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either> sendEmailVerification() async {
    return await getIt<AuthFirebaseService>().sendEmailVerification();
  }

  @override
  Future<Either> checkEmailVerification() async {
    return await getIt<AuthFirebaseService>().checkEmailVerification();
  }

  @override
  Future<Either> getAges() async {
    return await getIt<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> signin(UserSigninEntity user) async {
    return await getIt<AuthFirebaseService>().signin(user);
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await getIt<AuthFirebaseService>().sendPasswordResetEmail(email);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await getIt<AuthFirebaseService>().isLoggedin();
  }

  @override
  Future<Either> getUser() async {
    var user = await getIt<AuthFirebaseService>().getUser();

    return user.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(UserDataModel.fromMap(data).toEntity());
      },
    );
  }

  @override
  Future<Either> logOut() async {
    return await getIt<AuthFirebaseService>().logOut();
  }
}
