import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../custom_input_decoration.dart';

class PasswordGroup extends StatefulWidget {
  final FormGroup form;

  const PasswordGroup({
    Key? key,
    required this.form,
  }) : super(key: key);

  @override
  State<PasswordGroup> createState() => _PasswordGroupState();
}

class _PasswordGroupState extends State<PasswordGroup> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReactiveTextField<String>(
          formControlName: 'password',
          obscureText: _obscureText,
          validationMessages: (control) => {
            ValidationMessage.required: 'The password must not be empty',
            ValidationMessage.minLength:
                'The password must be at least 8 characters',
            ValidationMessage.pattern:
                'Contains at least a lowercase, an uppercase letter,\n a number and a symbol',
          },
          onSubmitted: () => widget.form.focus('passwordConfirmation'),
          textInputAction: TextInputAction.next,
          decoration: customInputDecoration(
            text: 'Password',
            suffixIcon: TextButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: const Text("Show"),
            ),
          ),
        ),
        const SizedBox(height: 12.0),
        ReactiveTextField<String>(
          formControlName: 'passwordConfirmation',
          obscureText: _obscureText,
          validationMessages: (control) =>
              {ValidationMessage.mustMatch: 'Password confirmation must match'},
          showErrors: (control) =>
              control.invalid && control.touched && control.dirty,
          onSubmitted: () => widget.form.focus('dob'),
          textInputAction: TextInputAction.next,
          decoration: customInputDecoration(
            text: 'Confirm Password',
            suffixIcon: TextButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              child: const Text("Show"),
            ),
          ),
        ),
      ],
    );
  }
}
