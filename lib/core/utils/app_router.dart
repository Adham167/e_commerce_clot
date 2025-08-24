import 'package:e_commerce_clot/features/authintication/presentation/views/login_view.dart';
import 'package:e_commerce_clot/features/spalsh/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const KLoginView = "/LoginView";
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: KLoginView, builder: (context, state) => const LoginView()),
    ],
  );
}
