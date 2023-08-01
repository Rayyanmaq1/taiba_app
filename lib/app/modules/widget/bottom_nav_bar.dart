// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taibaa/app/modules/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:taibaa/global/consts/color_constant.dart';
import 'package:taibaa/global/utils/app_text_style.dart';
import 'package:taibaa/global/utils/widget_spacing.dart';

class CustomBottomNavigationBar extends GetView<BottomNavController> {
  const CustomBottomNavigationBar({
    super.key,
    required this.items,
    required this.color,
    required this.dotColor,
    required this.onTap,
    this.iconSize = 22,
    this.selectedIndex = 2,
  });

  final List<String> items;
  final Color color;
  final Color dotColor;
  final ValueChanged<int> onTap;
  final double iconSize;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.9;
    final widthPerItem = width / items.length;

    return Positioned(
      bottom: 30,
      child: Container(
        decoration: BoxDecoration(
          color: kRedColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        height: 81,
        width: Get.width * 0.9,
        child: Column(
          children: [
            SizedBox(
              height: 80,
              width: Get.width * 0.9,
              child: Row(
                children: [
                  for (int index = 0; index < items.length; index++)
                    CupertinoButton(
                      minSize: 0,
                      padding: EdgeInsets.zero,
                      onPressed: () => onTap(index),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: widthPerItem,
                            height: 30,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: SvgPicture.asset(
                                controller.iconsList[index],
                                color: controller.selectedTab == index
                                    ? kBlackColor
                                    : kWhiteColor,
                              ),
                            ),
                          ),
                          4.verticalSpace,
                          Text(
                            controller.tabItems[index],
                            style: AppTextStyles.medium.copyWith(
                              color: controller.selectedTab == index
                                  ? kBlackColor
                                  : kWhiteColor,
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
