import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Color? color;
  final double? fontSize;
  final String hintText;
  final double? hintFontSize;
  final Color? borderColor;
  final bool? readOnly;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;

  const CustomTextField(
      {Key? key,
      required this.controller,
      this.keyboardType,
      this.color,
      this.fontSize,
      required this.hintText,
      this.hintFontSize,
      this.borderColor,
      this.readOnly,
      this.onTap,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLines,
      this.minLines
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  TextFormField(
      readOnly: readOnly ?? false,
      onTap: onTap,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      cursorColor: color ?? theme.colorScheme.primary,
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
      style: TextStyle(
          color: color ?? theme.colorScheme.primary,
          fontWeight: FontWeight.w500,
          fontSize: fontSize ?? 16.0,
          fontFamily: 'Montserrat'),
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
        prefixIcon: prefixIcon != null ? Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
          child: prefixIcon,
        ) : null,
        suffixIcon: suffixIcon != null ? Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
          child: suffixIcon,
        ) : null,
        filled: true,
        fillColor: (color ?? theme.colorScheme.primary).withOpacity(0.1),
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontWeight: FontWeight.normal,
            fontSize: hintFontSize ?? 16.0,
            fontFamily: 'Montserrat'),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: borderColor ?? Colors.white)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: borderColor ?? Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
                color: borderColor ?? Colors.white)),
      ) ,
    );
  }
}
