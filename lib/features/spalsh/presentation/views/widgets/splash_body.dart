
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Splash_body extends StatelessWidget {
  const Splash_body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: Duration(seconds: 2),
        curve: Curves.easeInOut,
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Transform.scale(scale: value, child: child),
          );
        },
        child: SvgPicture.asset("assets/images/Logo1.svg"),
      ),
    );
  }
}
