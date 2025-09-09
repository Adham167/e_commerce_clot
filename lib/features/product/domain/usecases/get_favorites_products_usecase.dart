import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';
import 'package:e_commerce_clot/features/product/domain/repo/product_repo.dart';

class GetFavoritesProductsUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await getIt<ProductRepo>().getFavoritesProducts();
  }
}
