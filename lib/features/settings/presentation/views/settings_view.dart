import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_style.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_app_bar.dart';
import 'package:e_commerce_clot/features/settings/presentation/manager/logout_cubit/logout_cubit.dart';
import 'package:e_commerce_clot/features/settings/presentation/widgets/log_out_bloc_listener.dart';
import 'package:e_commerce_clot/features/settings/presentation/widgets/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: const Text("Settings", style: AppStyle.styleBold24),
          action: Consumer<LogoutCubit>(
            builder: (context, logoutCubit, child) {
              return IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return LogoutDialog(logoutCubit: logoutCubit);
                    },
                  );
                },
                icon: const Icon(Icons.logout, color: AppColors.red),
              );
            },
          ),
        ),
        body:const LogOutBlocListener(),
      ),
    );
  }
}
