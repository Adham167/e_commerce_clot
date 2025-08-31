import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';
import 'package:e_commerce_clot/features/product/domain/repo/product_repo.dart';

class GetTopSellingUsecase implements Usecase<Either,dynamic> {
  @override
  Future<Either> call({dynamic params}) async{
    return await getIt<ProductRepo>().getTopSelling();
  }
}