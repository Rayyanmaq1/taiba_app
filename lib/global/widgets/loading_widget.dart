import 'package:flutter/material.dart';
import 'package:taibaa/global/consts/color_constant.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const SpinKitChasingDots(color: kRedColor);
  }
}
