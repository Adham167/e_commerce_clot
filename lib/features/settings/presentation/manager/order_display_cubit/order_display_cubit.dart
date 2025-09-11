import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/order/domain/entities/oreder_entity.dart';
import 'package:e_commerce_clot/features/order/domain/usecases/get_orders_usecase.dart';
import 'package:meta/meta.dart';

part 'order_display_state.dart';

class OrderDisplayCubit extends Cubit<OrderDisplayState> {
  OrderDisplayCubit() : super(OrderDisplayInitial());

  void displayOrders() async {
    emit(OrderDisplayLoading());
    log("message");
    var returnedData = await getIt<GetOrdersUsecase>().call();
    log("message");
    returnedData.fold(
      (error) {
        emit(OrderDisplayFailure(errMessage: error));
      },
      (data) {
        emit(OrderDisplayLoaded(orders: data));
      },
    );
  }
}
