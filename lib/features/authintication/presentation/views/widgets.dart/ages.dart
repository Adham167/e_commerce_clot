import 'package:e_commerce_clot/features/authintication/presentation/manager/age_display_cubit/age_display_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/age_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: BlocBuilder<AgeDisplayCubit, AgeDisplayState>(
        builder: (context, state) {
          if (state is AgeDisplayLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          } else if (state is AgeDisplayLoaded) {
            return AgeWidget(listAges: state.ages);
          } else if (state is AgeDisplayFailure) {
            return Container(
              alignment: Alignment.center,
              child: Text(state.message),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
