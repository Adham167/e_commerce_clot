
import 'package:e_commerce_clot/features/settings/presentation/widgets/my_favorites_tile.dart';
import 'package:e_commerce_clot/features/settings/presentation/widgets/my_orders_tile.dart';
import 'package:flutter/material.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [MyFavoritesTile(), SizedBox(height: 16), MyOrdersTile()],
      ),
    );
  }
}