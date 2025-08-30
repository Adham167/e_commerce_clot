import 'package:e_commerce_clot/features/authintication/presentation/manager/gender_cubit/gender_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/gender_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderButtonsWidget extends StatelessWidget {
  const GenderButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenderCubit, int>(
      builder: (context, state) {
        return const Row(
          children: [
            GenderTile(index: 1, gender: "Men"),
            SizedBox(width: 20),
            GenderTile(index: 2, gender: "Women"),
          ],
        );
      },
    );
  }
}
