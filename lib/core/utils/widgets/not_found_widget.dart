import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/assets.dart';
import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.imagesNotFoundSearch),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Sorry, we couldn't find any matching result for your Search.",
              style: AppStyle.styleMedium24,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
