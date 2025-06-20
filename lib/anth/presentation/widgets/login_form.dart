import 'package:fake_store_app/core/resource/app_routes.dart';
import 'package:fake_store_app/anth/presentation/widgets/auth_fotter_buttom.dart';
import 'package:flutter/material.dart';
import 'package:fake_store_app/core/utils/validators.dart';
import 'package:fake_store_app/core/widgets/custom_text_field.dart';
import 'package:fake_store_app/core/widgets/primary_button.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  final void Function(String username, String password) onSubmit;
  final bool isLoading;

  const LoginForm({
    super.key,
    required this.onSubmit,
    this.isLoading = false,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}


class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _showValidationErrors = false;
final Map<String, bool> _hasBeenEdited = {'username': false, 'password': false};



 void _submit() async {
  setState(() => _showValidationErrors = true);
  if (!_formKey.currentState!.validate()) return;

  widget.onSubmit(
    _usernameController.text.trim(),
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
            controller: _usernameController,
            labelText: 'username',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
    if (!Validators.isValidEmail(value ?? '')) return 'Invalid';
    return null;
  },
  hasError: _hasBeenEdited['username']! &&
      !Validators.isValidEmail(_usernameController.text),
  isValid: _hasBeenEdited['username']! &&
      Validators.isValidEmail(_usernameController.text),
  showIconOnly: !_showValidationErrors, 
  onChanged: (value) {
    setState(() => _hasBeenEdited['username'] = true);
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
  onPressed: widget.isLoading ? null : _submit,
  isLoading: widget.isLoading,
),

        ],
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
