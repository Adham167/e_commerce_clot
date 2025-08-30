import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/category/data/models/category_model.dart';
import 'package:e_commerce_clot/features/category/domain/repo/category_firebase_service.dart';
import 'package:e_commerce_clot/features/category/domain/repo/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  @override
  Future<Either> getCategories() async {
    var categories = await getIt<CategoryFirebaseService>().getCategories();
    return categories.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data).map((e) => CategoryModel.fromMap(e).toEntity()).toList()
        );
      },
    );
  }
}
