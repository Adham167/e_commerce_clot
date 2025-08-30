import 'package:e_commerce_clot/features/authintication/domain/repo/user_auth_repo.dart';
import 'package:e_commerce_clot/features/authintication/data/repo/user_auth_repo_impl.dart';
import 'package:e_commerce_clot/features/authintication/domain/repo/auth_firebase_service.dart';
import 'package:e_commerce_clot/features/authintication/data/source/auth_firebase_service_impl.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/get_ages_usecase.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/get_user_usecase.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/is_logged_in_usecase.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/send_password_reset_email_usecase.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/signin_usecase.dart';
import 'package:e_commerce_clot/features/authintication/domain/usecases/signup_usecase.dart';
import 'package:e_commerce_clot/features/category/data/repo/category_repo_impl.dart';
import 'package:e_commerce_clot/features/category/data/source/category_firebase_service_impl.dart';
import 'package:e_commerce_clot/features/category/domain/repo/category_firebase_service.dart';
import 'package:e_commerce_clot/features/category/domain/repo/category_repo.dart';
import 'package:e_commerce_clot/features/category/domain/usecases/get_categories_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> ServiceLocator() async {
  //services

  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  getIt.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());

  //repositories
  getIt.registerSingleton<UserAuthRepo>(UserAuthRepoImpl());
  getIt.registerSingleton<CategoryRepo>(CategoryRepoImpl());
  //usecases

    getIt.registerSingleton<SignupUsecase>(SignupUsecase());
    getIt.registerSingleton<SigninUsecase>(SigninUsecase());
    getIt.registerSingleton<GetAgesUsecase>(GetAgesUsecase());
    getIt.registerSingleton<SendPasswordResetEmailUsecase>(SendPasswordResetEmailUsecase());
    getIt.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
    getIt.registerSingleton<GetUserUsecase>(GetUserUsecase());
    getIt.registerSingleton<GetCategoriesUsecase>(GetCategoriesUsecase());

}
