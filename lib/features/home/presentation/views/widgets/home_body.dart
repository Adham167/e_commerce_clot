import 'package:e_commerce_clot/features/home/presentation/views/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HomeHeader()
      ],
    );
  }
}