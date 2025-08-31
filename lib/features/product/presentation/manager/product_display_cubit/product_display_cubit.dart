import 'package:bloc/bloc.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';
import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'product_display_state.dart';

class ProductDisplayCubit extends Cubit<ProductDisplayState> {
  final Usecase usecase;
  ProductDisplayCubit({required this.usecase})
    : super(ProductDisplayLoading());

  void displayProducts() async {
    var returnedData = await usecase.call();
    returnedData.fold(
      (error) => emit(ProductDisplayFailure()),
      (data) => emit(ProductDisplayLoaded(productEntity: data)),
    );
  }
}
