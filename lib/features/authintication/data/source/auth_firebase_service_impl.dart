import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/features/authintication/data/models/user_signin_model.dart';
import 'package:e_commerce_clot/features/authintication/domain/entities/sign_up_entity.dart';
import 'package:e_commerce_clot/features/authintication/domain/repo/auth_firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signup(SignUpEntity user) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: user.email,
            password: user.password,
          );

      final firebaseUser = credential.user;

      if (firebaseUser == null) {
        return const Left('Unable to create account. Please try again.');
      }

      final uid = firebaseUser.uid;

      await FirebaseFirestore.instance.collection('Users').doc(uid).set({
        'id': uid,
        'fullName': user.fullName,
        'phone': user.phone,
        'email': user.email,
        'gender': user.gender,
      });

      await firebaseUser.sendEmailVerification();

      return const Right("successful");
    } on FirebaseAuthException catch (e) {
      String message = "Please try again.";

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        message = 'Please enter a valid email address.';
      }

      return Left(message);
    } catch (e) {
      return const Left('Something went wrong. Please try again.');
    }
  }

  @override
  Future<Either> sendEmailVerification() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        return const Left('No authenticated user found.');
      }

      if (user.emailVerified) {
        return const Right('Email already verified.');
      }

      await user.sendEmailVerification();

      return const Right('Verification email sent.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'too-many-requests') {
        return const Left(
          'Too many requests. Please wait a while and try again.',
        );
      }

      return const Left('Could not send verification email. Please try again.');
    } catch (e) {
      return const Left('Please try again.');
    }
  }

  @override
  Future<Either> checkEmailVerification() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        return const Left('No authenticated user found.');
      }

      await user.reload();

      final refreshedUser = FirebaseAuth.instance.currentUser;

      if (refreshedUser == null) {
        return const Left('No authenticated user found.');
      }

      return Right(refreshedUser.emailVerified);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? 'Please try again.');
    } catch (e) {
      return const Left('Please try again.');
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      final returnedData =
          await FirebaseFirestore.instance.collection("Ages").get();

      return Right(returnedData.docs);
    } on Exception {
      return const Left("Please try again");
    }
  }

  @override
  Future<Either> signin(UserSigninEntity user) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      final firebaseUser = credential.user;

      if (firebaseUser == null) {
        return const Left('Unable to login. Please try again.');
      }

      if (!firebaseUser.emailVerified) {
        return const Left('email-not-verified');
      }

      return const Right("successful");
    } on FirebaseAuthException catch (e) {
      String message = "Please try again.";

      if (e.code == 'invalid-email') {
        message = 'Please enter a valid email address.';
      } else if (e.code == 'invalid-credential') {
        message = 'Invalid email or password.';
      }

      return Left(message);
    } catch (e) {
      return const Left('Please try again.');
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
    return FirebaseAuth.instance.currentUser != null;
  }

  @override
  Future<Either> getUser() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        return const Left('No authenticated user found.');
      }

      final doc =
          await FirebaseFirestore.instance
              .collection('Users')
              .doc(currentUser.uid)
              .get();

      if (!doc.exists || doc.data() == null) {
        return const Left('User data not found.');
      }

      return Right(doc.data()!);
    } catch (e) {
      return const Left('Please try again.');
    }
  }

  @override
  Future<Either> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      return const Right("Logged out !!");
    } catch (e) {
      return Left("ERROR $e TRY AGAIN");
    }
  }
}
