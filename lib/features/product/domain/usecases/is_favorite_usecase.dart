import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';
import 'package:e_commerce_clot/features/product/domain/repo/product_repo.dart';

class IsFavoriteUsecase implements Usecase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await getIt<ProductRepo>().isFavorite(params!);
  }
}
