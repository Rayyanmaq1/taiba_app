import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taibaa/global/consts/color_constant.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    super.key,
    required this.controller,
    this.hintText = 'Type here',
    this.hintColor = kCaptionTextColor,
    this.readOnly = false,
    this.obscureText = false,
    this.showSuffixIcon = false,
    this.suffixIcon = Icons.cancel_rounded,
    this.onSuffixTap,
    this.onChanged,
    this.prefixIcon,
    this.onTap,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.backgroundColor = kWhiteColor,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.placeHolderFontSize = 14,
    this.keyboardType,
    this.borderRadius = 24.0,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
  });

  final String hintText;
  final Color hintColor;
  final Color backgroundColor;
  final bool readOnly;
  final TextEditingController controller;
  final bool obscureText;
  final bool showSuffixIcon;
  final IconData suffixIcon;
  final VoidCallback? onSuffixTap;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final int maxLines;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final double placeHolderFontSize;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildTextField(),
        if (showSuffixIcon) _buildSuffixIcon(),
        if (prefixIcon != null) _buildPrefixIcon(),
      ],
    );
  }

  Widget _buildTextField() {
    return CupertinoTextField(
      padding: const EdgeInsets.only(
        left: 20,
        top: 13,
        bottom: 13,
        right: 20,
      ),
      maxLines: maxLines,
      readOnly: readOnly,
      onChanged: onChanged,
      onTap: onTap,
      cursorColor: kBlackColor,
      textAlign: textAlign,
      controller: controller,
      placeholder: hintText,
      obscureText: obscureText,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      placeholderStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: placeHolderFontSize,
        fontWeight: FontWeight.w500,
        color: hintColor,
      ),
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: kBlackColor,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return Positioned(
      right: 20,
      child: GestureDetector(
        onTap: onSuffixTap,
        child: Icon(
          suffixIcon,
          color: kCaptionTextColor,
          size: 20,
        ),
      ),
    );
  }

  Widget _buildPrefixIcon() {
    return Positioned(
      left: 20,
      child: prefixIcon!,
    );
  }
}
