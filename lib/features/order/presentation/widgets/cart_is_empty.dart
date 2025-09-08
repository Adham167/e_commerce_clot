import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CartIsEmpty extends StatelessWidget {
  const CartIsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.imagesCart),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Cart is empty", style: AppStyle.styleMedium24),
          ),
        ],
      ),
    );
  }
}
