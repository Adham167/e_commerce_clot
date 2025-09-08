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
import 'package:e_commerce_clot/features/order/data/repo/order_repo_impl.dart';
import 'package:e_commerce_clot/features/order/data/source/order_firebase_service_impl.dart';
import 'package:e_commerce_clot/features/order/domain/repo/order_firebase_service.dart';
import 'package:e_commerce_clot/features/order/domain/repo/order_repo.dart';
import 'package:e_commerce_clot/features/order/domain/usecases/add_to_cart_usecase.dart';
import 'package:e_commerce_clot/features/order/domain/usecases/get_cart_product_usecases.dart';
import 'package:e_commerce_clot/features/order/domain/usecases/order_registration_usecase.dart';
import 'package:e_commerce_clot/features/order/domain/usecases/remove_cart_product_usecases.dart';
import 'package:e_commerce_clot/features/product/data/repo/product_repo_impl.dart';
import 'package:e_commerce_clot/features/product/data/source/product_firebase_service_impl.dart';
import 'package:e_commerce_clot/features/product/domain/repo/product_firebase_service.dart';
import 'package:e_commerce_clot/features/product/domain/repo/product_repo.dart';
import 'package:e_commerce_clot/features/product/domain/usecases/get_new_in_usecase.dart';
import 'package:e_commerce_clot/features/product/domain/usecases/get_products_by_category_id.dart';
import 'package:e_commerce_clot/features/product/domain/usecases/get_products_by_title.dart';
import 'package:e_commerce_clot/features/product/domain/usecases/get_top_selling_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> ServiceLocator() async {
  //services

  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  getIt.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());
  getIt.registerSingleton<ProductFirebaseService>(ProductFirebaseServiceImpl());
  getIt.registerSingleton<OrderFirebaseService>(OrderFirebaseServiceImpl());

  //repositories
  getIt.registerSingleton<UserAuthRepo>(UserAuthRepoImpl());
  getIt.registerSingleton<CategoryRepo>(CategoryRepoImpl());
  getIt.registerSingleton<ProductRepo>(ProductRepoImpl());
  getIt.registerSingleton<OrderRepo>(OrderRepoImpl());
  //usecases

    getIt.registerSingleton<SignupUsecase>(SignupUsecase());
    getIt.registerSingleton<SigninUsecase>(SigninUsecase());
    getIt.registerSingleton<GetAgesUsecase>(GetAgesUsecase());
    getIt.registerSingleton<SendPasswordResetEmailUsecase>(SendPasswordResetEmailUsecase());
    getIt.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
    getIt.registerSingleton<GetUserUsecase>(GetUserUsecase());
    getIt.registerSingleton<GetCategoriesUsecase>(GetCategoriesUsecase());
    getIt.registerSingleton<GetTopSellingUsecase>(GetTopSellingUsecase());
    getIt.registerSingleton<GetNewInUsecase>(GetNewInUsecase());
    getIt.registerSingleton<GetProductsByCategoryIdUsecase>(GetProductsByCategoryIdUsecase());
    getIt.registerSingleton<GetProductsByTitleUsecase>(GetProductsByTitleUsecase());
    getIt.registerSingleton<AddToCartUsecase>(AddToCartUsecase());
    getIt.registerSingleton<GetCartProductUsecases>(GetCartProductUsecases());
    getIt.registerSingleton<RemoveCartProductUsecases>(RemoveCartProductUsecases());
    getIt.registerSingleton<OrderRegistrationUsecase>(OrderRegistrationUsecase());

}

