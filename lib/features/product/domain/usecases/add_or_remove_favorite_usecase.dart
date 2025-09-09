import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';
import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:e_commerce_clot/features/product/domain/repo/product_firebase_service.dart';

class AddOrRemoveFavoriteUsecase implements Usecase<Either, ProductEntity> {
  @override
  Future<Either> call({ProductEntity? params})async {
    return await getIt<ProductFirebaseService>().addOrRemoveFavoriteProduct(params!);
  }
}
