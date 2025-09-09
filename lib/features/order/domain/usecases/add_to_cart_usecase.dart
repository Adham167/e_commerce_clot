import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';
import 'package:e_commerce_clot/features/order/data/models/add_to_cart_model.dart';
import 'package:e_commerce_clot/features/order/domain/repo/order_repo.dart';

class AddToCartUsecase implements Usecase<Either, AddToCartModel> {
  @override
  Future<Either> call({AddToCartModel? params}) async {
    return await getIt<OrderRepo>().addToCart(params!);
  }
}
