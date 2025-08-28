import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_model.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_signin_model.dart';

abstract class UserAuthRepo {
  Future<Either> signup(UserModel user);
  Future<Either> signin(UserSigninModel user);
  Future<Either> getAges();
}
