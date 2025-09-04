import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_colors_state.dart';

class ProductColorsCubit extends Cubit<int> {
  ProductColorsCubit() : super(1);

  int selectedIndex = 1;
  void itemSelection(int index) {
    selectedIndex = index;
    emit(index);
  }
}
