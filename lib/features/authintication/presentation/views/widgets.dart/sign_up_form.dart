import 'package:e_commerce_clot/core/utils/app_validators.dart';
import 'package:e_commerce_clot/core/utils/widgets/custom_text_field.dart';
import 'package:e_commerce_clot/features/authintication/domain/entities/sign_up_entity.dart';
import 'package:e_commerce_clot/features/authintication/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/custom_action_button.dart';
import 'package:e_commerce_clot/features/authintication/presentation/views/widgets.dart/gender_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController _fullNameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  int gender = 0;

  late final FocusNode _fullNameFocusNode;
  late final FocusNode _phoneFocusNode;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _confirmPasswordFocusNode;

  @override
  void initState() {
    super.initState();

    _fullNameController = TextEditingController();
    _phoneController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    _fullNameFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    _fullNameFocusNode.dispose();
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();

    super.dispose();
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Hide keyboard and remove focus before submitting.
    FocusScope.of(context).unfocus();

    final user = SignUpEntity(
      fullName: _fullNameController.text.trim(),
      phone: _phoneController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text,
      gender: gender,
    );

    context.read<SignUpCubit>().signUp(user);
  }

  bool _validateField(
    String? Function(String?) validator,
    String value,
  ) {
    return validator(value) == null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Full Name
          CustomTextfield(
            text: "Full Name",
            controller: _fullNameController,
            focusNode: _fullNameFocusNode,
            textInputAction: TextInputAction.next,
            validator: AppValidators.validateName,
            onFieldSubmitted: (_) {
              if (_validateField(
                AppValidators.validateName,
                _fullNameController.text,
              )) {
                FocusScope.of(context).requestFocus(
                  _phoneFocusNode,
                );
              }
            },
          ),

          const SizedBox(height: 16),

          // Phone
          CustomTextfield(
            text: "Phone",
            controller: _phoneController,
            focusNode: _phoneFocusNode,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            validator: AppValidators.validatePhone,
            onFieldSubmitted: (_) {
              if (_validateField(
                AppValidators.validatePhone,
                _phoneController.text,
              )) {
                FocusScope.of(context).requestFocus(
                  _emailFocusNode,
                );
              }
            },
          ),

          const SizedBox(height: 16),

          // Email
          CustomTextfield(
            text: "Email Address",
            controller: _emailController,
            focusNode: _emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: AppValidators.validateEmail,
            onFieldSubmitted: (_) {
              if (_validateField(
                AppValidators.validateEmail,
                _emailController.text,
              )) {
                FocusScope.of(context).requestFocus(
                  _passwordFocusNode,
                );
              }
            },
          ),

          const SizedBox(height: 16),

          // Gender
          GenderSelector(
            value: gender,
            onChanged: (value) {
              setState(() {
                gender = value;
              });

              FocusScope.of(context).requestFocus(
                _passwordFocusNode,
              );
            },
          ),

          const SizedBox(height: 16),

          // Password
          CustomTextfield(
            text: "Password",
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            isPassword: true,
            textInputAction: TextInputAction.next,
            validator: AppValidators.validatePassword,
            onFieldSubmitted: (_) {
              if (_validateField(
                AppValidators.validatePassword,
                _passwordController.text,
              )) {
                FocusScope.of(context).requestFocus(
                  _confirmPasswordFocusNode,
                );
              }
            },
          ),

          const SizedBox(height: 16),

          // Confirm Password
          CustomTextfield(
            text: "Confirm Password",
            controller: _confirmPasswordController,
            focusNode: _confirmPasswordFocusNode,
            isPassword: true,
            textInputAction: TextInputAction.done,
            validator: (value) {
              final passwordError =
                  AppValidators.validatePassword(value);

              if (passwordError != null) {
                return passwordError;
              }

              if (value != _passwordController.text) {
                return "Passwords do not match";
              }

              return null;
            },
            onFieldSubmitted: (_) {
              _submitForm();
            },
          ),

          const SizedBox(height: 24),

          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return CustomActionButton(
                title: "Create Account",
                isLoading: state is SignUpLoading,
                onPressed: _submitForm,
              );
            },
          ),
        ],
      ),
    );
  }
}