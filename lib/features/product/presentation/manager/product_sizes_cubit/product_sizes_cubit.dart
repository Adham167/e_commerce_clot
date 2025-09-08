import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_sizes_state.dart';

class ProductSizesCubit extends Cubit<int> {
  ProductSizesCubit() : super(0);

  int selectedIndex = 0;
  void itemSelection(int index) {
    selectedIndex = index;
    emit(index);
  }
}
