import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/order/data/models/add_to_cart_model.dart';
import 'package:e_commerce_clot/features/order/domain/repo/order_firebase_service.dart';
import 'package:e_commerce_clot/features/order/domain/repo/order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  @override
  Future<Either> addToCart(AddToCartModel addToCartModel) {
    return getIt<OrderFirebaseService>().addToCart(addToCartModel);
  }
}
