import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/order/data/models/add_to_cart_model.dart';
import 'package:e_commerce_clot/features/order/data/models/order_registration_model.dart';
import 'package:e_commerce_clot/features/order/data/models/product_ordered_model.dart';
import 'package:e_commerce_clot/features/order/domain/repo/order_firebase_service.dart';
import 'package:e_commerce_clot/features/order/domain/repo/order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  @override
  Future<Either> addToCart(AddToCartModel addToCartModel) {
    return getIt<OrderFirebaseService>().addToCart(addToCartModel);
  }

  @override
  Future<Either> getCartProducts() async {
    var returnedData = await getIt<OrderFirebaseService>().getCartProducts();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(
            data,
          ).map((e) => ProductOrderedModel.fromMap(e).toEntity()).toList(),
        );
      },
    );
  }

  @override
  Future<Either> removeCartProducts(String id) async {
    var returnedData = await getIt<OrderFirebaseService>().removeCartProducts(
      id,
    );
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(data);
      },
    );
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationModel order) async {
    var returnedData = await getIt<OrderFirebaseService>().orderRegistration(
      order,
    );
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(data);
      },
    );
  }
}
