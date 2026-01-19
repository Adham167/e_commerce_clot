import 'package:e_commerce_clot/features/authintication/data/models/user_model.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/forgot_password_view.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/gender_and_age_view.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/login_view.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/reset_password_view.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/sign_up_view.dart';
import 'package:e_commerce_clot/features/category/domain/entities/category_entity.dart';
import 'package:e_commerce_clot/features/category/presentation/views/all_categories_view.dart';
import 'package:e_commerce_clot/features/home/presentation/views/home_view.dart';
import 'package:e_commerce_clot/features/order/domain/entities/oreder_entity.dart';
import 'package:e_commerce_clot/features/order/domain/entities/product_ordered_entity.dart';
import 'package:e_commerce_clot/features/order/presentation/views/cart_view.dart';
import 'package:e_commerce_clot/features/order/presentation/views/check_out_view.dart';
import 'package:e_commerce_clot/features/order/presentation/views/order_placed_view.dart';
import 'package:e_commerce_clot/features/product/domain/entities/product_entity.dart';
import 'package:e_commerce_clot/features/product/presentation/views/category_products_view.dart';
import 'package:e_commerce_clot/features/product/presentation/views/porduct_details_view.dart';
import 'package:e_commerce_clot/features/search/presentation/views/search_view.dart';
import 'package:e_commerce_clot/features/settings/presentation/views/my_favorites_view.dart';
import 'package:e_commerce_clot/features/settings/presentation/views/my_orders_view.dart';
import 'package:e_commerce_clot/features/settings/presentation/views/order_details_view.dart';
import 'package:e_commerce_clot/features/settings/presentation/views/order_items_view.dart';
import 'package:e_commerce_clot/features/settings/presentation/views/settings_view.dart';
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
  static const kCartView = "/CartView";
  static const kCheckOutView = "/CheckOutView";
  static const kOrderPlacedView = "/OrderPlacedView";
  static const kSettingsView = "/SettingsView";
  static const kMyFavoritesView = "/MyFavoritesView";
  static const kMyOrdersView = "/MyOrdersView";
  static const kOrderDetailsView = "/OrderDetailsView";
  static const kOrderItemsView = "/OrderItemsView";

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: KLoginView, builder: (context, state) => const LoginView()),
      GoRoute(path: kCartView, builder: (context, state) => const CartView()),
      GoRoute(
        path: kOrderPlacedView,
        builder: (context, state) => const OrderPlacedView(),
      ),
      GoRoute(
        path: kSettingsView,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: kMyFavoritesView,
        builder: (context, state) => const MyFavoritesView(),
      ),
      GoRoute(
        path: kMyOrdersView,
        builder: (context, state) => const MyOrdersView(),
      ),
      GoRoute(
        path: kOrderDetailsView,
        builder: (context, state) {
          final orderEntity = state.extra as OrederEntity;
          return OrderDetailsView(orederEntity: orderEntity);
        },
      ),
      GoRoute(
        path: kOrderItemsView,
        builder: (context, state) {
          final products = state.extra as List<ProductOrderedEntity>;
          return OrderItemsView(products: products);
        },
      ),
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
          return PorductDetailsView(productEntity: product);
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
        path: kCheckOutView,
        builder: (context, state) {
          final products = state.extra as List<ProductOrderedEntity>;
          return CheckOutView(products: products);
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
