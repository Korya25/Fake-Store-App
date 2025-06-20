import 'package:fake_store_app/anth/presentation/controller/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/utils/validators.dart';
import 'package:fake_store_app/core/widgets/custom_text_field.dart';
import 'package:fake_store_app/core/widgets/primary_button.dart';
import 'package:fake_store_app/anth/presentation/widgets/auth_fotter_buttom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:fake_store_app/core/resource/app_routes.dart';

class SignUpForm extends StatefulWidget {
  final void Function(String name, String email, String password) onSubmit;
  final bool isLoading;

  const SignUpForm({
    super.key,
    required this.onSubmit,
    this.isLoading = false,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _showValidationErrors = false;

  final Map<String, bool> _hasBeenEdited = {
    'Name': false,
    'email': false,
    'password': false,
  };

  void _submit() {
    setState(() => _showValidationErrors = true);
    if (!_formKey.currentState!.validate()) return;

    widget.onSubmit(
      _nameController.text.trim(),
      _emailController.text.trim(),
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: _nameController,
            labelText: 'Name',
            validator: (value) {
              if (!Validators.isValidName(value ?? '')) return 'Invalid';
              return null;
            },
            hasError: _hasBeenEdited['Name']! &&
                !Validators.isValidName(_nameController.text),
            isValid: _hasBeenEdited['Name']! &&
                Validators.isValidName(_nameController.text),
            showIconOnly: !_showValidationErrors,
            onChanged: (value) {
              setState(() => _hasBeenEdited['Name'] = true);
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _emailController,
            labelText: 'Email',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (!Validators.isValidEmail(value ?? '')) return 'Invalid';
              return null;
            },
            hasError: _hasBeenEdited['email']! &&
                !Validators.isValidEmail(_emailController.text),
            isValid: _hasBeenEdited['email']! &&
                Validators.isValidEmail(_emailController.text),
            showIconOnly: !_showValidationErrors,
            onChanged: (value) {
              setState(() => _hasBeenEdited['email'] = true);
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: _passwordController,
            labelText: 'Password',
            obscureText: true,
            validator: (value) {
              if (!Validators.isValidPassword(value ?? '')) return 'Invalid';
              return null;
            },
            hasError: _hasBeenEdited['password']! &&
                !Validators.isValidPassword(_passwordController.text),
            isValid: _hasBeenEdited['password']! &&
                Validators.isValidPassword(_passwordController.text),
            showIconOnly: !_showValidationErrors,
            onChanged: (value) {
              setState(() => _hasBeenEdited['password'] = true);
            },
          ),
          const SizedBox(height: 16),
          AuthFotterButtom(
            title: 'Already have an account?',
            onTap: () => context.pushNamed(AppRoutes.login),
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            text: 'SIGN UP',
            onPressed: widget.isLoading ? null : _submit,
            isLoading: widget.isLoading,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
      context.read<UserCubit>().reset(); 

    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
