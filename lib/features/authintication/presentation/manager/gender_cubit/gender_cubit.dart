import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'gender_state.dart';

class GenderCubit extends Cubit<int> {
  GenderCubit() : super(1);

  int selectedIndex = 0;
  void selectGender(int index) {
    selectedIndex = index;
    emit(index);
  }
}
