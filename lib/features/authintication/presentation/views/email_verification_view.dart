import 'package:e_commerce_clot/core/di/service_locator.dart';
import 'package:e_commerce_clot/core/utils/app_colors.dart';
import 'package:e_commerce_clot/core/utils/app_router.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/email_verification_cubit/email_verification_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EmailVerificationView extends StatelessWidget {
  const EmailVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final email = FirebaseAuth.instance.currentUser?.email ?? '';

    return BlocProvider(
      create: (_) => getIt<EmailVerificationCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BlocListener<EmailVerificationCubit, EmailVerificationState>(
              listener: (context, state) {
                if (state is EmailVerified) {
                  GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                }

                if (state is EmailVerificationSent) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Verification email sent successfully.'),
                    ),
                  );
                }

                if (state is EmailNotVerified) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Your email has not been verified yet.'),
                    ),
                  );
                }

                if (state is EmailVerificationFailure) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.mark_email_unread_outlined,
                        size: 80,
                        color: AppColors.primary,
                      ),

                      const SizedBox(height: 24),

                      Text(
                        'Verify Your Email',
                        style: Theme.of(
                          context,
                        ).textTheme.headlineSmall?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 12),

                      Text(
                        'We sent a verification link to:',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 6),

                      Text(
                        email,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 16),

                      Text(
                        'Please check your inbox and click the verification link to verify your email address.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 32),

                      BlocBuilder<
                        EmailVerificationCubit,
                        EmailVerificationState
                      >(
                        builder: (context, state) {
                          final isChecking =
                              state is EmailVerificationChecking ||
                              state is EmailVerificationResending;
                          return SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: ElevatedButton(
                              onPressed:
                                  isChecking
                                      ? null
                                      : () {
                                        context
                                            .read<EmailVerificationCubit>()
                                            .checkVerification();
                                      },
                              child:
                                  isChecking
                                      ? const SizedBox(
                                        width: 22,
                                        height: 22,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                      : const Text("I've Verified My Email"),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 16),

                      BlocBuilder<
                        EmailVerificationCubit,
                        EmailVerificationState
                      >(
                        builder: (context, state) {
                          final isResending =
                              state is EmailVerificationResending ||
                              state is EmailVerificationChecking;

                          return TextButton(
                            onPressed:
                                isResending
                                    ? null
                                    : () {
                                      context
                                          .read<EmailVerificationCubit>()
                                          .resendEmail();
                                    },
                            child:
                                isResending
                                    ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                    : const Text('Resend Verification Email'),
                          );
                        },
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "Didn't receive the email? Check your spam folder.",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
