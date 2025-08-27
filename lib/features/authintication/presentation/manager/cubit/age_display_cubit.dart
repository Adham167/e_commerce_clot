import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/get_ages_usecase.dart';
import 'package:meta/meta.dart';

part 'age_display_state.dart';

class AgeDisplayCubit extends Cubit<AgeDisplayState> {
  AgeDisplayCubit() : super(AgeDisplayLoading());

  void displayAges() async {
    var returnedData = await getIt<GetAgesUsecase>().call();
    log("hello");
    returnedData.fold(
      (message) {
        emit(AgeDisplayFailure(message: message));
      },
      (ages) {
        emit(AgeDisplayLoaded(ages: ages));
      },
    );
  }
}
