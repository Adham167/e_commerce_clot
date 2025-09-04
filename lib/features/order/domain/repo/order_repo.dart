import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/features/order/data/models/add_to_cart_model.dart';

abstract class OrderRepo {
  Future<Either> addToCart(AddToCartModel addToCartModel);
}
