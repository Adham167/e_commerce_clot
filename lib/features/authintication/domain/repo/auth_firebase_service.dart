import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_model.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_signin_model.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserModel user);
  Future<Either> signin(UserSigninModel user);
  Future<Either> sendPasswordResetEmail(String email);
  Future<Either> getAges();
  Future<Either> getUser();
  Future<bool> isLoggedin();
  Future<Either> logOut();
}
