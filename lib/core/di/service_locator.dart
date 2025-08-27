import 'package:e_commerce_clot/features/authintication/domain/repo/user_auth_repo.dart';
import 'package:e_commerce_clot/features/authintication/data/repo/user_auth_repo_impl.dart';
import 'package:e_commerce_clot/features/authintication/domain/repo/auth_firebase_service.dart';
import 'package:e_commerce_clot/features/authintication/data/source/auth_firebase_service_impl.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/get_ages_usecase.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/signup_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> ServiceLocator() async {
  //services

  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  //repositories
  getIt.registerSingleton<UserAuthRepo>(UserAuthRepoImpl());
  //usecases

    getIt.registerSingleton<SignupUsecase>(SignupUsecase());
    getIt.registerSingleton<GetAgesUsecase>(GetAgesUsecase());

}
