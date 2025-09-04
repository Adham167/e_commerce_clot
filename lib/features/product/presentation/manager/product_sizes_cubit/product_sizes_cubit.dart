import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_sizes_state.dart';

class ProductSizesCubit extends Cubit<int> {
  ProductSizesCubit() : super(1);

  int selectedIndex = 1;
  void itemSelection(int index) {
    selectedIndex = index;
    emit(index);
  }
}
