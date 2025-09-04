
import 'package:bloc/bloc.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';
import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'product_display_state.dart';

class ProductDisplayCubit extends Cubit<ProductDisplayState> {
  final Usecase usecase;
  ProductDisplayCubit({required this.usecase}) : super(ProductDisplayInitial());

  void displayProducts({dynamic params}) async {
    emit(ProductDisplayLoading());

    var returnedData = await usecase.call(params: params);

    returnedData.fold(
      (error) => emit(ProductDisplayFailure()),
      (data) => emit(ProductDisplayLoaded(productEntity: data)),
    );
  }

  void displayInitial() {
    emit(ProductDisplayInitial());
  }
}
