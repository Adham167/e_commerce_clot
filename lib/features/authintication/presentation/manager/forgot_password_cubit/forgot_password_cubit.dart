import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/send_password_reset_email_usecase.dart';
import 'package:flutter/material.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.sendEmail) : super(ForgotPasswordInitial());
  final SendPasswordResetEmailUsecase sendEmail;
  Future<void> sendResetEmail(String params) async {
    emit(ForgotPasswordLoading());
    try {
      Either returnedData = await sendEmail.call(params: params);
      returnedData.fold(
        (message) {
          emit(ForgotPasswordFailure(errMessage: message));
        },
        (data) {
          emit(ForgotPasswordSuccess());
        },
      );
    } catch (e) {
      emit(ForgotPasswordFailure(errMessage: e.toString()));
    }
  }
}
