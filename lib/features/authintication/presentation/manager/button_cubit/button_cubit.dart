import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';
import 'package:meta/meta.dart';

part 'button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitial());

  Future<void> execute({dynamic params, required Usecase usecase}) async {
    emit(ButtonLoading());
    try {
      Either returnedData = await usecase.call(params: params);
      returnedData.fold(
        (message) {
          emit(ButtonFailure(errMessage: message));
        },
        (data) {
          emit(ButtonSuccess());
        },
      );
    } catch (e) {
      emit(ButtonFailure(errMessage: e.toString()));
    }
  }
}
