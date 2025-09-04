import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/features/order/data/models/add_to_cart_model.dart';
import 'package:e_commerce_clot/features/order/domain/repo/order_firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OrderFirebaseServiceImpl implements OrderFirebaseService {
  @override
  Future<Either> addToCart(AddToCartModel addToCartModel) async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(user!.uid)
          .collection("Cart")
          .add(addToCartModel.toMap());
      return const Right("Add to cart was successfully");
    } catch (e) {
            return const Left("Please try again.");

    }
  }
}
