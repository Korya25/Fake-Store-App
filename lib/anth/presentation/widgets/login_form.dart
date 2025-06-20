import 'package:fake_store_app/core/resource/app_routes.dart';
import 'package:fake_store_app/anth/presentation/widgets/auth_fotter_buttom.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/utils/validators.dart';
import 'package:fake_store_app/core/widgets/custom_text_field.dart';
import 'package:fake_store_app/core/widgets/primary_button.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  final void Function(String email, String password) onSubmit;

  const LoginForm({super.key, required this.onSubmit});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _showValidationErrors = false;
Map<String, bool> _hasBeenEdited = {'email': false, 'password': false};


  bool _isLoading = false;

 void _submit() async {
  setState(() => _showValidationErrors = true);
  if (!_formKey.currentState!.validate()) return;

  setState(() => _isLoading = true);
  await Future.delayed(const Duration(seconds: 2));
  setState(() => _isLoading = false);

  widget.onSubmit(
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
      !Validators.isValidEmail(_passwordController.text),
  isValid: _hasBeenEdited['password']! &&
      Validators.isValidEmail(_passwordController.text),
  showIconOnly: !_showValidationErrors,
  onChanged: (value) {
    setState(() => _hasBeenEdited['password'] = true);
  },
          ),
          const SizedBox(height: 16),
          AuthFotterButtom(
            title: 'Forgot your password?',
            onTap: () => context.pushNamed(AppRoutes.forgotPassword),
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            text: 'LOGIN',
            onPressed: _isLoading ? null : _submit,
            isLoading: _isLoading,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
