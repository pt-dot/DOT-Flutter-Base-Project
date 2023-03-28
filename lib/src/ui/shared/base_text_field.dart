import 'package:base_flutter/src/ui/constants/text_sizes.dart';
import 'package:base_flutter/src/ui/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final String? prefixString;
  final Widget? suffixIcon;
  final Function(String)? onChange;
  final bool enabled;
  final int minLines;
  final int maxLines;
  final bool? multiline;
  final Color backgroundColor;
  final Color disableColor;
  final Color? hintColor;
  final Stream<Object>? stream;
  final String? errorMessage;
  final bool outline;
  final bool obscureText;
  final bool borderAlwaysEnable;
  final int? textLength;
  final Color borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final TextStyle? style;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final bool isTransportation;

  InputField({
    Key? key,
    this.controller,
    this.label,
    this.textInputType = TextInputType.text,
    this.textInputAction,
    this.enabled = true,
    this.prefixIcon,
    this.prefixString,
    this.suffixIcon,
    this.onChange,
    this.multiline,
    this.minLines = 1,
    this.maxLines = 1,
    this.backgroundColor = Colors.white,
    this.disableColor = Colors.black45,
    this.hintColor,
    this.stream,
    this.errorMessage,
    this.outline = false,
    this.obscureText = false,
    this.borderAlwaysEnable = false,
    this.textLength,
    this.borderColor = Colors.grey,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.style,
    this.focusNode,
    this.textCapitalization = TextCapitalization.none,
    this.isTransportation = false,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return widget.stream != null
        ? StreamBuilder<Object>(
            stream: widget.stream,
            builder: (context, snapshot) {
              return _buildTextField(
                snapshot.hasError && snapshot.error.toString().isNotEmpty
                    ? snapshot.error.toString()
                    : null,
              );
            })
        : _buildTextField(widget.errorMessage != null &&
                widget.errorMessage?.isNotEmpty == true
            ? widget.errorMessage
            : null);
  }

  TextField _buildTextField(error) {
    return TextField(
      maxLength: widget.textLength,
      autofocus: false,
      focusNode: widget.focusNode,
      enabled: widget.enabled,
      onChanged: widget.onChange,
      keyboardType: widget.textInputType,
      inputFormatters: widget.inputFormatters,
      maxLines: widget.textInputType == TextInputType.visiblePassword
          ? 1
          : widget.maxLines,
      minLines: widget.textInputType == TextInputType.multiline ||
              widget.multiline == true
          ? widget.minLines
          : 1,
      obscureText: widget.textInputType == TextInputType.visiblePassword ||
          widget.obscureText,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        filled: true,
        fillColor:
            widget.enabled ? widget.backgroundColor : widget.disableColor,
        hintText: widget.label,
        hintStyle: widget.style != null
            ? widget.style!.copyWith(color: widget.hintColor ?? Colors.grey)
            : AppTextStyle.regularStyle
                .copyWith(color: widget.hintColor ?? Colors.black54),
        contentPadding: const EdgeInsets.all(12),
        focusedBorder: _buildOutlineInput(Colors.blue, error),
        enabledBorder: _buildOutlineInput(widget.borderColor, error),
        errorBorder: _buildOutlineInput(widget.borderColor, error),
        disabledBorder: widget.borderAlwaysEnable
            ? _buildOutlineInput(widget.borderColor, error)
            : InputBorder.none,
        border: _buildOutlineInput(widget.borderColor, error),
        errorMaxLines: 2,
        errorText: error,
        errorStyle: AppTextStyle.regularStyle.copyWith(color: Colors.red),
      ),
      style: widget.style ??
          AppTextStyle.regularStyle.copyWith(
              color: error == null ? Colors.blue.shade800 : Colors.red),
      controller: widget.controller,
      textAlign: widget.textAlign,
      textCapitalization: widget.textCapitalization,
    );
  }

  OutlineInputBorder _buildOutlineInput(Color borderColor, error) {
    return OutlineInputBorder(
      borderSide: widget.outline
          ? BorderSide(
              style: BorderStyle.solid,
              color: error == null ? borderColor : Colors.red,
              width: 1)
          : BorderSide.none,
      borderRadius: const BorderRadius.all(
        Radius.circular(BorderSize.regularBorderRadius),
      ),
    );
  }
}
