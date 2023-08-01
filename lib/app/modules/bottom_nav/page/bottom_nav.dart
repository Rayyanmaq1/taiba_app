import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taibaa/app/modules/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:taibaa/app/modules/widget/bottom_nav_bar.dart';
import 'package:taibaa/global/consts/color_constant.dart';

class BottomNav extends GetView<BottomNavController> {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Obx(
          () => controller.tabPages[controller.selectedTab],
        ),
        Obx(
          () => CustomBottomNavigationBar(
            selectedIndex: controller.selectedTab,
            items: controller.tabItems,
            color: kRedColor,
            dotColor: kBlackColor,
            onTap: controller.selectTab,
          ),
        ),
      ],
    );
  }
}
