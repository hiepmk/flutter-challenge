import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../custom_input_decoration.dart';
import '../validators/validators_form.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ReactiveFormBuilder(
            form: () => signInForm,
            builder: (context, form, child) {
              return Column(
                children: <Widget>[
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        ReactiveTextField<String>(
                          formControlName: 'email',
                          validationMessages: (control) => {
                            ValidationMessage.required:
                                'The email must not be empty',
                            ValidationMessage.email:
                                'The email value must be a valid email',
                          },
                          onSubmitted: () => form.focus('password'),
                          textInputAction: TextInputAction.next,
                          decoration: customInputDecoration(text: 'Email'),
                        ),
                        const SizedBox(height: 12.0),
                        ReactiveTextField<String>(
                          formControlName: 'password',
                          obscureText: _obscureText,
                          validationMessages: (control) => {
                            ValidationMessage.required:
                                'The password must not be empty',
                            ValidationMessage.minLength:
                                'The password must be at least 8 characters',
                            ValidationMessage.pattern:
                                'Contains at least a lowercase, an uppercase letter,\n a number and a symbol',
                          },
                          textInputAction: TextInputAction.done,
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
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ReactiveFormConsumer(
                          builder: (context, form, child) => SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: form.valid
                                  ? () =>
                                      Navigator.pushNamed(context, '/signup')
                                  : null,
                              child: const Text('Sign In'),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Forgot you password?"),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
