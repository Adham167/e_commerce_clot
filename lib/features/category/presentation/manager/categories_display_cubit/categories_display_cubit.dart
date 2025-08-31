import 'package:bloc/bloc.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/category/domain/entities/category_entity.dart';
import 'package:e_commerce_clot/features/category/domain/usecases/get_categories_usecase.dart';
import 'package:meta/meta.dart';

part 'categories_display_state.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesDisplayLoading());

  void displayCategories() async {
    var categories = await getIt<GetCategoriesUsecase>().call();

    categories.fold(
      (error) => emit(CategoriesDisplayFailure()),
      (data) => emit(CategoriesDisplayLoaded(categories: data)),
    );
  }
}
