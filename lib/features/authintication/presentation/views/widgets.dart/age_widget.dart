
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/age_range_cubit/age_range_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgeWidget extends StatelessWidget {
  const AgeWidget({super.key, required this.listAges});
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> listAges;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);
            BlocProvider.of<AgeRangeCubit>(
              context,
            ).selectAge(listAges[index].data()['value']);
          },
          child: Text(
            listAges[index].data()['value'],
            style: AppStyle.styleMedium16,
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: listAges.length,
    );
  }
}
