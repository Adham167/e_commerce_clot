import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';
import 'package:e_commerce_clot/features/order/domain/repo/order_repo.dart';

class RemoveCartProductUsecases implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async{
    return getIt<OrderRepo>().removeCartProducts(params!);
  }
}
