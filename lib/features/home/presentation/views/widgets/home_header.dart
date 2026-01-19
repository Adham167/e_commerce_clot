import 'package:e_commerce_clot/core/entities/user_entity.dart';
import 'package:e_commerce_clot/features/home/presentation/manager/user_info_display_cubit/user_info_display_cubit.dart';
import 'package:e_commerce_clot/features/home/presentation/views/widgets/cart_widget.dart';
import 'package:e_commerce_clot/features/home/presentation/views/widgets/gender_widget.dart';
import 'package:e_commerce_clot/features/home/presentation/views/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUserInfo(),
      child: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 16, right: 16),
        child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
          builder: (context, state) {
            if (state is UserInfoDisplayLoading) {
              return const LoaddingHeaderWidget();
            } else if (state is UserInfoDisplayLoaded) {
              return LoadedHeaderWidget(user: state.userEntity);
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class LoadedHeaderWidget extends StatelessWidget {
  const LoadedHeaderWidget({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfileImage(user: user),
        GenderWidget(user: user),
        const CartWidget(),
      ],
    );
  }
}

class LoaddingHeaderWidget extends StatelessWidget {
  const LoaddingHeaderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LoaddingProfileImage(),
        LoaddingGenderWidget(),
        LoaddingCartWidget(),
      ],
    );
  }
}
