import 'package:e_commerce_clot/core/utils/widgets/empty_widget.dart';
import 'package:e_commerce_clot/features/settings/presentation/manager/order_display_cubit/order_display_cubit.dart';
import 'package:e_commerce_clot/features/settings/presentation/widgets/my_orders_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersBody extends StatelessWidget {
  const MyOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: BlocBuilder<OrderDisplayCubit, OrderDisplayState>(
        builder: (context, state) {
          if (state is OrderDisplayLoaded) {
            return state.orders.isEmpty
                ? const EmptyWidget()
                : Expanded(child: MyOrdersListView(orders: state.orders));
          } else if (state is OrderDisplayLoading) {
            return const Expanded(child: LoaddingMyOrdersListView());
          } else if (state is OrderDisplayFailure) {
            return const Center(child: Text("Please try again"));
          }
          return Container();
        },
      ),
    );
  }
}
