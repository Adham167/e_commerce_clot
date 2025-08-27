import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/core/utils/app_theme.dart';
import 'package:e_commerce_clot/features/spalsh/presentation/manager/splash_cubit/splash_cubit.dart';
import 'package:e_commerce_clot/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ServiceLocator();
  runApp(const ECommerceClot());
}

class ECommerceClot extends StatelessWidget {
  const ECommerceClot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..AppStarted(),
      child: MaterialApp.router(
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
