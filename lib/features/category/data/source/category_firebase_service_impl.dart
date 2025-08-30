import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/features/category/domain/repo/category_firebase_service.dart';

class CategoryFirebaseServiceImpl implements CategoryFirebaseService {
  @override
  Future<Either> getCategories() async {
    try {
      var categories =
          await FirebaseFirestore.instance.collection("Categories").get();
      return Right(
        categories.docs.map((e) => e.data()).toList()
      );
    } catch (e) {
      return const Left("Please try again");
    }
  }
}
