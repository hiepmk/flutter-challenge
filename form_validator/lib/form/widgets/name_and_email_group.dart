import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../custom_input_decoration.dart';

class NameAndEmailGroup extends StatelessWidget {
  final FormGroup form;

  const NameAndEmailGroup({
    Key? key,
    required this.form,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReactiveTextField<String>(
          formControlName: 'name',
          validationMessages: (control) => {
            ValidationMessage.required: 'The name must not be empty',
          },
          onSubmitted: () => form.focus('email'),
          textInputAction: TextInputAction.next,
          decoration: customInputDecoration(text: 'Name'),
        ),
        const SizedBox(height: 12.0),
        ReactiveTextField<String>(
          formControlName: 'email',
          validationMessages: (control) => {
            ValidationMessage.required: 'The email must not be empty',
            ValidationMessage.email: 'The email value must be a valid email',
          },
          onSubmitted: () => form.focus('password'),
          textInputAction: TextInputAction.next,
          decoration: customInputDecoration(text: 'Email'),
        ),
      ],
    );
  }
}
