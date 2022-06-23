import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../custom_input_decoration.dart';
import '../validators/validators_form.dart';
import 'widgets/name_and_email_group.dart';
import 'widgets/password_group.dart';
import 'widgets/radio_group.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: ReactiveFormBuilder(
              form: () => signUpForm,
              builder: (context, form, child) {
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ),
                    NameAndEmailGroup(
                      form: form,
                    ),
                    const SizedBox(height: 12.0),
                    PasswordGroup(
                      form: form,
                    ),
                    const SizedBox(height: 12.0),
                    ReactiveTextField<DateTime>(
                      formControlName: 'dob',
                      readOnly: true,
                      inputFormatters: const [],
                      validationMessages: (control) => {
                        ValidationMessage.required:
                            'The birthday must not be empty',
                        'isAdult':
                            'You must be the age 18 or above to be able to sign up'
                      },
                      decoration: customInputDecoration(
                        text: 'Birthday',
                        suffixIcon: ReactiveDatePicker<DateTime>(
                          formControlName: 'dob',
                          firstDate: DateTime(1970),
                          lastDate: DateTime.now(),
                          builder: (context, picker, child) {
                            return IconButton(
                              onPressed: picker.showPicker,
                              icon: const Icon(Icons.date_range),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    RadioGroup(form: form),
                    const SizedBox(height: 12.0),
                    ListTile(
                      leading: ReactiveRadio(
                        formControlName: 'newsletter',
                        value: false,
                        toggleable: true,
                      ),
                      title: const Text(
                          'I would like to receive your newsletter \nand other promotional infomation'),
                    ),
                    ReactiveFormConsumer(
                      builder: (context, form, child) => SizedBox(
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: form.valid
                              ? () => Navigator.pushNamed(context, '/signin')
                              : null,
                          child: const Text('Sign Up'),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Forgot you password?"),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
