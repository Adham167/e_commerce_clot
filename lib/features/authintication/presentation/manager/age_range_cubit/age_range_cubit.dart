import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'age_range_state.dart';

class AgeRangeCubit extends Cubit<String> {
  AgeRangeCubit() : super("Age Range");

  String selectedAge = "";

  void selectAge(String age) {
    selectedAge = age;
    emit(selectedAge);
  }
}
