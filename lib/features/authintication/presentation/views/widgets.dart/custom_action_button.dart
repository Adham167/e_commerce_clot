import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final Widget? content;
  final bool isLoading;

  const CustomActionButton({
    super.key,
    required this.onPressed,
    this.title = '',
    this.height,
    this.content,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 50),
      ),
      child:
          isLoading
              ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: Colors.white,
                ),
              )
              : (content ?? Text(title, style: AppStyle.styleMedium16)),
    );
  }
}
