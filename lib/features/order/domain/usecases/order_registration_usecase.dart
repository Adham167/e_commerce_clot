import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/usecases/usecase.dart';
import 'package:e_commerce_clot/features/order/data/models/order_registration_model.dart';
import 'package:e_commerce_clot/features/order/domain/repo/order_firebase_service.dart';

class OrderRegistrationUsecase
    implements Usecase<Either, OrderRegistrationModel> {
  @override
  Future<Either> call({OrderRegistrationModel? params}) {
    return getIt<OrderFirebaseService>().orderRegistration(params!);
  }
}
