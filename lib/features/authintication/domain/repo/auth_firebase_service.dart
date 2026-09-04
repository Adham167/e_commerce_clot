import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_signin_model.dart';
import 'package:e_commerce_clot/features/authintication/domain/entities/sign_up_entity.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(SignUpEntity user);

  Future<Either> signin(UserSigninEntity user);

  Future<Either> sendPasswordResetEmail(String email);

  Future<Either> sendEmailVerification();

  Future<Either> checkEmailVerification();

  Future<Either> getAges();

  Future<Either> getUser();

  Future<bool> isLoggedin();

  Future<Either> logOut();
}