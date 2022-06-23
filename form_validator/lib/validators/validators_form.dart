import 'package:reactive_forms/reactive_forms.dart';

FormControl name = FormControl<String>(
  validators: [
    Validators.required,
  ],
);
FormControl email = FormControl<String>(
  validators: [
    Validators.required,
    Validators.email,
  ],
);
FormControl password = FormControl<String>(
  validators: [
    Validators.required,
    Validators.minLength(8),
    Validators.pattern(
      RegExp(passwordPattern),
    ),
  ],
);
FormControl passwordConfirmation = FormControl<String>();
FormControl dob = FormControl<DateTime>(
  validators: [
    Validators.required,
  ],
  asyncValidators: [miniumAge],
);
FormGroup radio = FormGroup(
  {
    'choose': FormControl<int>(value: 1),
    'other': FormControl<String>(
      validators: [Validators.required],
    ),
  },
);
FormControl newsletter = FormControl<bool>();

const passwordPattern =
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

Future<Map<String, dynamic>?> miniumAge(
    AbstractControl<dynamic> control) async {
  final error = {'isAdult': false};
  DateTime dob = control.value;
  DateTime today = DateTime.now();

  final isUnderAge = await Future.delayed(
      const Duration(seconds: 1),
      () =>
          (DateTime(today.year, dob.month, dob.day).isBefore(today)
              ? today.year - dob.year
              : today.year - dob.year - 1) <
          18);

  if (isUnderAge) return error;
  return null;
}

FormGroup get signUpForm => fb.group(
      <String, Object>{
        'name': name,
        'email': email,
        'password': password,
        'passwordConfirmation': passwordConfirmation,
        'dob': dob,
        'radio': radio,
        'newsletter': newsletter,
      },
      [
        Validators.mustMatch('password', 'passwordConfirmation'),
      ],
    );

FormGroup get signInForm => fb.group(<String, Object>{
      'email': email,
      'password': password,
    });
