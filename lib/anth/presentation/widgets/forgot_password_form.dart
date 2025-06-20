import 'package:flutter/material.dart';
import 'package:fake_store_app/core/utils/validators.dart';
import 'package:fake_store_app/core/widgets/custom_text_field.dart';
import 'package:fake_store_app/core/widgets/primary_button.dart';
import 'package:fake_store_app/core/resource/app_text_style.dart';
import 'package:fake_store_app/core/constant/app_colors.dart';

class ForgotPasswordForm extends StatefulWidget {
  final void Function(String email) onSubmit;
    final bool isLoading;


  const ForgotPasswordForm({super.key, required this.onSubmit,  this.isLoading = false});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
bool _showValidationErrors = false;
final Map<String, bool> _hasBeenEdited = {'email': false};


void _submit() {
  setState(() => _showValidationErrors = true);
  if (!_formKey.currentState!.validate()) return;

  widget.onSubmit(_emailController.text.trim());
}



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Please, enter your email address. You will receive a link to create a new password via email.',
            style: AppTextStyle.descriptiveItems.copyWith(
              color: AppColors.ordinaryText,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32),
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
          const SizedBox(height: 32),
         PrimaryButton(
            text: 'SEND',
            onPressed: widget.isLoading ? null : _submit,
            isLoading: widget.isLoading,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
