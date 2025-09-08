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

  @override
  Future<Either> getCartProducts() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      var returnedData =
          await FirebaseFirestore.instance
              .collection("Users")
              .doc(user!.uid)
              .collection("Cart")
              .get();
      List<Map> products = [];
      for (var item in returnedData.docs) {
        var data = item.data();
        data.addAll({"id": item.id});
        products.add(data); 
      }
      return Right(products);
    } catch (e) {
      return const Left("Please try agian.");
    }
  }

  @override
  Future<Either> removeCartProducts(String id) async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection("Users")
          .doc(user!.uid)
          .collection("Cart")
          .doc(id)
          .delete();

      return const Right("Product removed successfully  ");
    } catch (e) {
      return const Left("Please try agian.");
    }
  }
}
