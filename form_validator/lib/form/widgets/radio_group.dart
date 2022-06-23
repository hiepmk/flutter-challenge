import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../custom_input_decoration.dart';

class RadioGroup extends StatefulWidget {
  final FormGroup form;

  const RadioGroup({
    Key? key,
    required this.form,
  }) : super(key: key);

  @override
  State<RadioGroup> createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReactiveRadioListTile(
          value: 1,
          formControlName: 'radio.choose',
          title: const Text("Flutter is great!"),
        ),
        ReactiveRadioListTile(
          value: 2,
          formControlName: 'radio.choose',
          title: const Text("Flutter is awesome!"),
        ),
        ReactiveRadioListTile(
          value: 3,
          formControlName: 'radio.choose',
          title: const Text("Other"),
        ),
        ReactiveValueListenableBuilder<int>(
          formControlName: 'radio.choose',
          builder: (context, control, child) {
            var controlOther = widget.form.control('radio.other');
            control.value == 3
                ? controlOther.markAsEnabled()
                : controlOther.markAsDisabled();
            return Visibility(
              visible: control.value == 3,
              child: ReactiveTextField(
                formControlName: 'radio.other',
                decoration: customInputDecoration(text: 'Other'),
                validationMessages: (control) =>
                    {ValidationMessage.required: 'Other must be not empty'},
              ),
            );
          },
        ),
      ],
    );
  }
}
