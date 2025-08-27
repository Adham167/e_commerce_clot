import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/cubit/age_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ages extends StatelessWidget {
  const Ages({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
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
            return Text(state.message);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _age(List<QueryDocumentSnapshot<Map<String, dynamic>>> ages) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Text(ages[index].data()['value'],style: AppStyle.styleRegular12,);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: ages.length,
    );
  }
}
