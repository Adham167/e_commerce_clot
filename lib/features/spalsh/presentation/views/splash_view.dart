import 'package:e_commerce_clot/features/spalsh/presentation/manager/splash_cubit/splash_cubit.dart';
import 'package:e_commerce_clot/features/spalsh/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginView()),
            );
          }
        },
        child: Center(
          child: SvgPicture.asset(
            "assets/images/Rectangle13.svg",
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
