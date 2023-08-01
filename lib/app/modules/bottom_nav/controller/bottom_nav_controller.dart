import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:taibaa/app/modules/home/pages/home_page.dart';
import 'package:taibaa/global/consts/color_constant.dart';

class BottomNavController extends GetxController {
  final _selectedTab = 0.obs;

  int get selectedTab => _selectedTab.value;

  void selectTab(int value) {
    _selectedTab.value = value;
  }

  final tabItems = <String>[
    'Home',
    'My Ticket',
    'Notice',
    'Account',
  ];

  final tabPages = <Widget>[
    HomePage(),
    Container(
      height: Get.height,
      width: Get.width,
      color: kWhiteColor,
      child: const Center(
        child: Text('Coming soon'),
      ),
    ),
    Container(
      height: Get.height,
      width: Get.width,
      color: kWhiteColor,
      child: const Center(
        child: Text('Coming soon'),
      ),
    ),
    Container(
      height: Get.height,
      width: Get.width,
      color: kWhiteColor,
      child: const Center(
        child: Text('Coming soon'),
      ),
    ),
  ];
  final iconsList = <String>[
    'assets/icons/svg/home.svg',
    'assets/icons/svg/my_ticket.svg',
    'assets/icons/svg/notice.svg',
    'assets/icons/svg/account.svg',
  ];
}
