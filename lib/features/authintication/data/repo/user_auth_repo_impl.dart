import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_model.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_signin_model.dart';
import 'package:e_commerce_clot/features/authintication/domain/repo/user_auth_repo.dart';
import 'package:e_commerce_clot/features/authintication/domain/repo/auth_firebase_service.dart';

class UserAuthRepoImpl extends UserAuthRepo {
  @override
  Future<Either> signup(UserModel user) async {
    return await getIt<AuthFirebaseService>().signup(user);
  }

  @override
  Future<Either> getAges() async {
    return await getIt<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> signin(UserSigninModel user) async{
       return await getIt<AuthFirebaseService>().signin(user);

  }
}
