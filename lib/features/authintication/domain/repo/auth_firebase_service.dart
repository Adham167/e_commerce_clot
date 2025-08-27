import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_model.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(UserModel user);
  Future<Either> getAges();
}
