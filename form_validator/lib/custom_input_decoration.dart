import 'package:flutter/material.dart';

InputDecoration customInputDecoration({
  String? text,
  Widget? suffixIcon,
}) {
  return InputDecoration(
    labelText: text,
    filled: true,
    fillColor: Colors.grey[300],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
    ),
    suffixIcon: suffixIcon,
  );
}
