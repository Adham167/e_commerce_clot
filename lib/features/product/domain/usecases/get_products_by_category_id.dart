import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';
import 'package:e_commerce_clot/features/product/domain/repo/product_repo.dart';

class GetProductsByCategoryIdUsecase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await getIt<ProductRepo>().getProductsByCategoryId(params!);
  }
}
