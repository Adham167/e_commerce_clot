import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/features/order/data/models/add_to_cart_model.dart';
import 'package:e_commerce_clot/features/order/data/models/order_registration_model.dart';

abstract class OrderRepo {
  Future<Either> addToCart(AddToCartModel addToCartModel);
  Future<Either> getCartProducts();
  Future<Either> removeCartProducts(String id);
  Future<Either> orderRegistration(OrderRegistrationModel order);
}
