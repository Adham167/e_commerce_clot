import 'package:dartz/dartz.dart';
import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/features/authintication/domain/repo/user_auth_repo.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/usecase.dart';

class GetAgesUsecase  implements Usecase<Either,dynamic>{
  @override
  Future<Either> call({dynamic params}) async {
    return await getIt<UserAuthRepo>().getAges();
  }
  
}