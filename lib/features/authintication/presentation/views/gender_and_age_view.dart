import 'package:e_commerce_clot/core/utils/widgets/custom_app_bar.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/gender_and_age_body.dart';
import 'package:flutter/material.dart';

class GenderAndAgeView extends StatelessWidget {
  const GenderAndAgeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: GenderAndAgeBody(),
    );
  }
}
