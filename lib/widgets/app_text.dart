import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppText extends StatelessWidget {

  AppText(
    this.label,
    this.hint, {
    this.password = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
  });

  String label;
  String hint;
  bool password;
  TextEditingController controller;
  FormFieldValidator<String> validator;
  TextInputType keyboardType;
  TextInputAction textInputAction;
  List<TextInputFormatter> inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters : inputFormatters,
      style: TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        labelText: label,
        labelStyle: TextStyle(fontSize: 25, color: Colors.grey),
        hintText: hint,
      ),
    );
  }
}
