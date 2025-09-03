import 'package:e_commerce_clot/features/authintication/data/models/user_model.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/forgot_password_view.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/gender_and_age_view.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/login_view.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/reset_password_view.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/sign_up_view.dart';
import 'package:e_commerce_clot/features/category/domain/entities/category_entity.dart';
import 'package:e_commerce_clot/features/category/presentation/views/all_categories_view.dart';
import 'package:e_commerce_clot/features/home/presentation/views/home_view.dart';
import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:e_commerce_clot/features/product/presentation/views/category_products_view.dart';
import 'package:e_commerce_clot/features/product/presentation/views/porduct_details_view.dart';
import 'package:e_commerce_clot/features/search/presentation/views/search_view.dart';
import 'package:e_commerce_clot/features/spalsh/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const KLoginView = "/LoginView";
  static const KSignupView = "/SignupView";
  static const KForgotPassword = "/ForgotPassword";
  static const kGenderAndAgeView = "/GenderAndAgeView";
  static const kResetPasswordView = "/ResetPasswordView";
  static const kHomeView = "/HomeView";
  static const kAllCategoriesView = "/AllCategoriesView";
  static const kCategoryProductsView = "/CategoryProductsView";
  static const kSearchView = "/SearchView";
  static const kPorductDetailsView = "/PorductDetailsView";

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: KLoginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: kResetPasswordView,
        builder: (context, state) => const ResetPasswordView(),
      ),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kAllCategoriesView,
        builder: (context, state) => const AllCategoriesView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kPorductDetailsView,
        builder: (context, state) {
          final product = state.extra as ProductEntity;
          return PorductDetailsView(productEntity: product,);
        },
      ),
      GoRoute(
        path: kGenderAndAgeView,
        builder: (context, state) {
          final user = state.extra as UserModel;
          return GenderAndAgeView(userModel: user);
        },
      ),
      GoRoute(
        path: kCategoryProductsView,
        builder: (context, state) {
          final categoryEntity = state.extra as CategoryEntity;
          return CategoryProductsView(categoryEntity: categoryEntity);
        },
      ),
      GoRoute(
        path: KSignupView,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: KForgotPassword,
        builder: (context, state) => const ForgotPasswordView(),
      ),
    ],
  );
}
