import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:e_commerce_clot/features/product/domain/usecases/add_or_remove_favorite_usecase.dart';
import 'package:e_commerce_clot/features/product/domain/usecases/is_favorite_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIconCubit extends Cubit<bool> {
  FavoriteIconCubit() : super(false);

  void isFavorite(String productId) async {
    var result = await getIt<IsFavoriteUsecase>().call(params: productId);
    emit(result);
  }

  void onTap(ProductEntity product) async {
    var result = await getIt<AddOrRemoveFavoriteUsecase>().call(
      params: product,
    );

    result.fold((error) {}, (data) {
      emit(data);
    });
  }
}
