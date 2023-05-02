import 'package:base_flutter/src/ui/styles/colors.dart';
import 'package:flutter/material.dart';

class BaseCommonTextInput extends StatelessWidget {
  final TextEditingController textFieldController;
  final String label;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Color? backgroundColor;
  final Function(String)? onChanged;
  final String? error;

  const BaseCommonTextInput({
    required this.textFieldController,
    required this.label,
    this.onChanged,
    this.textInputType,
    this.textInputAction,
    this.backgroundColor,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType ?? TextInputType.text,
      obscureText: textInputType == TextInputType.visiblePassword,
      textInputAction: textInputAction ?? TextInputAction.done,
      onChanged: onChanged,
      decoration: InputDecoration(
        errorText: error,
        hintText: label,
        fillColor: backgroundColor ?? textFieldBackgroundColor,
        hintStyle: TextStyle(color: textTintColor, fontSize: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1,
            color: borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1,
            color: borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1,
            color: primary,
          ),
        ),
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
      ),
      style: TextStyle(
        fontSize: 14,
        color: textColor,
      ),
      controller: textFieldController,
    );
  }
}
