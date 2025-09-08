
import 'package:bloc/bloc.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/order/domain/entities/product_ordered_entity.dart';
import 'package:e_commerce_clot/features/order/domain/usecases/get_cart_product_usecases.dart';
import 'package:e_commerce_clot/features/order/domain/usecases/remove_cart_product_usecases.dart';
import 'package:meta/meta.dart';

part 'cart_products_state.dart';

class CartProductsCubit extends Cubit<CartProductsState> {
  CartProductsCubit() : super(CartProductsInitial());

  void displayCartProducts() async {
    emit(CartProductsLoading());

    var returnedData = await getIt<GetCartProductUsecases>().call();

    returnedData.fold(
      (error) {
        emit(CartProductsFailure(errMessage: error));
      },
      (data) {
        emit(CartProductsLoaded(productList: data));
      },
    );
  }

  void removeProduct(ProductOrderedEntity product) async {
    emit(CartProductsLoading());
    var returnedData = await getIt<RemoveCartProductUsecases>().call(
      params: product.id,
    );

    returnedData.fold(
      (error) {
        emit(CartProductsFailure(errMessage: error));
      },
      (data) {
        displayCartProducts(); 
      },
    );
  }
}
