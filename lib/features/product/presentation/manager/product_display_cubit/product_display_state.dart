part of 'product_display_cubit.dart';

@immutable
sealed class ProductDisplayState {}

final class ProductDisplayLoading extends ProductDisplayState {}
final class ProductDisplayInitial extends ProductDisplayState {}

final class ProductDisplayLoaded extends ProductDisplayState {
  final List<ProductEntity> productEntity;

  ProductDisplayLoaded({required this.productEntity});
}

final class ProductDisplayFailure extends ProductDisplayState {}
