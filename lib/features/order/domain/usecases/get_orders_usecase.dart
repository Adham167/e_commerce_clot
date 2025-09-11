import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';
import 'package:e_commerce_clot/features/order/domain/repo/order_repo.dart';

class GetOrdersUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async{
    return getIt<OrderRepo>().getOrders();
  }
}
