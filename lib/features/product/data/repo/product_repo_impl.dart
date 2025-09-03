import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/product/data/models/product_model.dart';
import 'package:e_commerce_clot/features/product/domain/repo/product_firebase_service.dart';
import 'package:e_commerce_clot/features/product/domain/repo/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  @override
  Future<Either> getTopSelling() async {
    var returnedData = await getIt<ProductFirebaseService>().getTopSelling();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }
  
  @override
  Future<Either> getNewIn()async {
    var returnedData = await getIt<ProductFirebaseService>().getNewIn();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }
  
  @override
  Future<Either> getProductsByCategoryId(String categoryId)async {
    var returnedData = await getIt<ProductFirebaseService>().getProductsByCategoryId(categoryId);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }
  
  @override
  Future<Either> getProductsByTitle(String title) async{
    var returnedData = await getIt<ProductFirebaseService>().getProductsByTitle(title);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }
}
