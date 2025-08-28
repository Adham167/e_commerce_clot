import 'package:e_commerce_clot/features/authintication/data/models/user_model.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/forgot_password_view.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/gender_and_age_view.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/login_view.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/sign_up_view.dart';
import 'package:e_commerce_clot/features/spalsh/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const KLoginView = "/LoginView";
  static const KSignupView = "/SignupView";
  static const KForgotPassword = "/ForgotPassword";
  static const kGenderAndAgeView = "/GenderAndAgeView";

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: KLoginView, builder: (context, state) => const LoginView()),
      GoRoute(
        path: kGenderAndAgeView,
        builder: (context, state) {
          final user = state.extra as UserModel;
          return  GenderAndAgeView(userModel: user,);
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
