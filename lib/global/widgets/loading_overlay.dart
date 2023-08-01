import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:taibaa/global/consts/color_constant.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 4,
        sigmaY: 4,
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: kBlackColor.withOpacity(0.65),
        child: const Center(
          child: CircularProgressIndicator(
            color: kRedColor,
            strokeWidth: 1,
          ),
        ),
      ),
    );
  }
}
