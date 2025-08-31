import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/features/product/domain/repo/product_firebase_service.dart';

class ProductFirebaseServiceImpl implements ProductFirebaseService {
  @override
  Future<Either> getTopSelling() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance
              .collection("Products")
              .where("salesNumber", isGreaterThanOrEqualTo: 20)
              .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left("Please try again");
    }
  }
  
  @override
  Future<Either> getNewIn() async{
    try {
      var returnedData =
          await FirebaseFirestore.instance
              .collection("Products")
              .where("createdDate", isGreaterThanOrEqualTo: Timestamp.fromDate(DateTime(2024,7,16)))
              .get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left("Please try again");
    }
  }
}
