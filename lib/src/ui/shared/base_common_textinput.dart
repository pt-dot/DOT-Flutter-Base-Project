import 'package:base_flutter/src/ui/shared/ui_constants.dart';
import 'package:flutter/material.dart';

class BaseCommonTextInput extends StatelessWidget {

  @required final TextEditingController textFieldController;
  @required final String label;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Color backgroundColor;

  BaseCommonTextInput({
    this.textFieldController, 
    this.label, 
    this.textInputType, 
    this.textInputAction,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: textInputType ?? TextInputType.text,
      obscureText: textInputType == TextInputType.visiblePassword,
      textInputAction: textInputAction ?? TextInputAction.done,
      decoration: InputDecoration(
        hintText: label,
        fillColor: backgroundColor ?? AppColors.white,
        hintStyle: TextStyle(color: AppColors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(style: BorderStyle.solid, width: 1, color: Colors.grey[50]),
        ),
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15)
      ),
      style: TextStyle(
        fontSize: TextSizeConst.regular, 
        color: AppColors.darkBlue,
      ),
      controller: textFieldController,
    );
  }
}