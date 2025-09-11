import 'package:e_commerce_clot/core/utils/widgets/custom_app_bar.dart';
import 'package:e_commerce_clot/features/settings/presentation/manager/order_display_cubit/order_display_cubit.dart';
import 'package:e_commerce_clot/features/settings/presentation/widgets/my_orders_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDisplayCubit()..displayOrders(),
      child: const Scaffold(
        appBar: CustomAppBar(title: Text("My Orders")),
        body: MyOrdersBody(),
      ),
    );
  }
}
