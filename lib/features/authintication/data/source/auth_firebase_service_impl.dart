import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_model.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_signin_model.dart';
import 'package:e_commerce_clot/features/authintication/domain/repo/auth_firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signup(UserModel user) async {
    try {
      var returnedData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.eamil!,
            password: user.password!,
          );

      FirebaseFirestore.instance
          .collection("Users")
          .doc(returnedData.user!.uid)
          .set({
            'firstname': user.firstName,
            'lastname': user.lastName,
            'email': user.eamil,
            'password': user.password,

            'gender': user.gender,
            'age': user.age,
          });
      return const Right("successful");
    } on FirebaseAuthException catch (e) {
      String message = " ";
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection("Ages").get();
      return Right(returnedData.docs);
    } on Exception {
      return const Left("Please try again");
    }
  }

  @override
  Future<Either> signin(UserSigninModel user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      return const Right("successful");
    } on FirebaseAuthException catch (e) {
      String message = " ";
      if (e.code == 'invalid-email') {
        message = 'No user found for that email.';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user.';
      }
      return Left(message);
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right('Password reset email is sent');
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<bool> isLoggedin() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      var userData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser?.uid)
          .get()
          .then((value) => value.data());
      return Right(userData);
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
