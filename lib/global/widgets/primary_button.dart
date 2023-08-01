import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taibaa/global/consts/color_constant.dart';
import 'package:taibaa/global/consts/constant.dart';
import 'package:get/get.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonColor = kRedColor,
    this.textColor = kWhiteColor,
    this.inactive = false,
    this.showBorder = false,
    this.borderColor = kRedColor,
    this.borderRadius = 15,
    this.borderWidth = 1.5,
    this.processing = false,
    this.height = 54,
    this.icon,
    this.textFontWeight = FontWeight.w500,
    this.isHalfWidth = false,
  });

  final String text;
  final bool inactive;
  final Color buttonColor;
  final Color textColor;
  final Widget? icon;
  final VoidCallback onPressed;
  final bool showBorder;
  final Color borderColor;
  final double borderRadius;
  final double borderWidth;
  final bool processing;
  final double height;
  final FontWeight textFontWeight;
  final bool isHalfWidth;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(borderRadius),
      color: buttonColor,
      disabledColor: buttonColor.withOpacity(0.55),
      onPressed: inactive
          ? null
          : () {
              if (processing) return;
              onPressed();
            },
      child: _buildButtonContent(),
    );
  }

  Widget _buildButtonContent() {
    return Container(
      height: height,
      width: isHalfWidth ? Get.width * 0.5 : double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: showBorder
            ? Border.all(
                color: borderColor,
                width: borderWidth,
              )
            : const Border(),
      ),
      child: _buildTextAndIcon(),
    );
  }

  Widget _buildTextAndIcon() {
    return processing
        ? const Center(
            child: CircularProgressIndicator(
              color: kWhiteColor,
              strokeWidth: 1,
            ),
          )
        : Stack(
            alignment: Alignment.center,
            children: [
              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: textFontWeight,
                      fontFamily: kFontFamily,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              if (icon != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: icon,
                  ),
                ),
            ],
          );
  }
}
