import 'package:e_commerce_clot/core/utils/app_theme.dart';
import 'package:e_commerce_clot/features/spalsh/presentation/manager/splash_cubit/splash_cubit.dart';
import 'package:e_commerce_clot/features/spalsh/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const ECommerceClot());
}

class ECommerceClot extends StatelessWidget {
  const ECommerceClot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..AppStarted(),
      child: MaterialApp(
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}
