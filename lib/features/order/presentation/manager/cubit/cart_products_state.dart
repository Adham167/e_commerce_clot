part of 'cart_products_cubit.dart';

@immutable
sealed class CartProductsState {}

final class CartProductsInitial extends CartProductsState {}

final class CartProductsLoading extends CartProductsState {}

final class CartProductsLoaded extends CartProductsState {
  final List<ProductOrderedEntity> productList;

  CartProductsLoaded({required this.productList});
}

final class CartProductsFailure extends CartProductsState {
  final String errMessage;

  CartProductsFailure({required this.errMessage});
}
