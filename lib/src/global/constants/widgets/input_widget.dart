// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class InputWidget extends StatelessWidget {
  String? Function(String?)? validator;
  TextEditingController? controller;
  bool obscureText;
  String labelText;
  Color cursorColor;
  Widget? suffixIcon;
  String errorText;
  String hintText;
  TextStyle hintStyle;
  TextInputType keyboardType;
  Color borderColor;
  Function onDone;
  Function onEditingComplete;
  int maxLength;
  int maxLines;
  bool enabled;
  TextInputAction? textinputAction;
  Function(String) onChanged;

  InputWidget({
    this.keyboardType = TextInputType.text,
    this.cursorColor = Colors.black,
    required this.validator,
    required this.controller,
    this.borderColor = Colors.blue,
    this.obscureText = false,
    this.labelText = '',
    this.hintText = '',
    this.hintStyle = const TextStyle(color: Colors.black),
    required this.onChanged,
    this.suffixIcon,
    required this.onDone,
    required this.onEditingComplete,
    this.textinputAction,
    this.maxLength = 32,
    this.maxLines = 1,
    this.enabled = true,
    this.errorText = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          enabled: enabled,
          maxLines: maxLines,
          maxLength: maxLength,
          onFieldSubmitted: (s) {
            onDone();
          },
          onEditingComplete: () {
            onEditingComplete();
          },
          textInputAction: textinputAction,
          obscureText: obscureText,
          validator: validator,
          style: hintStyle == null ? null : hintStyle,
          keyboardType: keyboardType,
          controller: controller,
          cursorColor: cursorColor == null
              ? Theme.of(context).primaryColor
              : cursorColor,
          onChanged: onChanged == null ? null : onChanged,
          decoration: InputDecoration(
            counterText: "",
            errorMaxLines: 3,
            errorText: errorText.isEmpty ? null : errorText,
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(14.0)),
            ),
            hintText: hintText,
            hintStyle: hintStyle == null
                ? TextStyle(color: Colors.grey[600])
                : hintStyle,
            suffixIcon: suffixIcon,
            focusedBorder: borderColor == null
                ? OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(14.0)),
                  )
                : OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                    borderRadius: const BorderRadius.all(Radius.circular(14.0)),
                  ),
            enabledBorder: borderColor == null
                ? const OutlineInputBorder()
                : OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                    borderRadius: const BorderRadius.all(Radius.circular(14.0)),
                  ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor),
              borderRadius: const BorderRadius.all(Radius.circular(14.0)),
            ),
            border: borderColor == null
                ? OutlineInputBorder()
                : OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor)),
          ),
        ),
      ],
    );
  }
}
