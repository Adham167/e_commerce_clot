import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/age_range_cubit/age_range_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/age_display_cubit/age_display_cubit.dart';
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
            return _age(state.ages);
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

  Widget _age(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
            BlocProvider.of<AgeRangeCubit>(
              context,
            ).selectAge(ages[index].data()['value']);
          },
          child: Text(
            ages[index].data()['value'],
            style: AppStyle.styleMedium16,
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: ages.length,
    );
  }
}
