// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:taibaa/app/modules/home/controllers/home_controller.dart';
import 'package:taibaa/app/routes/app_route.dart';
import 'package:taibaa/generated/assets.dart';
import 'package:taibaa/global/consts/color_constant.dart';
import 'package:taibaa/global/utils/app_text_style.dart';
import 'package:get/get.dart';
import 'package:taibaa/global/utils/widget_spacing.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taibaa/global/widgets/loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Sign out'),
              onTap: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                prefs.clear();
                Get.delete<HomePageController>(force: true);
                Get.offAllNamed(Routes.landing);
              },
            ),
            Builder(builder: (context) {
              return ListTile(
                title: const Text('Close Drawer'),
                onTap: () => Scaffold.of(context).closeDrawer(),
              );
            })
          ],
        ),
      ),
      leading: SvgPicture.asset(
        'assets/icons/svg/drawer.svg',
      ),
      title: const Text("Welcome"),

      headerWidget: headerWidget(context),
      headerExpandedHeight: 0.3,
      // headerBottomBar: headerBottomBarWidget(),
      body: [
        listView(),
      ],
      fullyStretchable: false,
      backgroundColor: Colors.white,
      appBarColor: kRedColor,
    );
  }

  Row headerBottomBarWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        50.verticalSpace,
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      color: kRedColor,
      child: Stack(
        children: [
          Positioned(
            top: 40,
            left: 10,
            child: SizedBox(
              height: 50,
              width: 50,
              child: Builder(builder: (context) {
                return CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image.asset(
                    'assets/icons/images/drawer.png',
                    // color: kWhiteColor,
                  ),
                );
              }),
            ),
          ),
          GetX<HomePageController>(builder: (ctrl) {
            if (ctrl.processing) {
              return const Text('Loading...');
            }
            return Positioned(
              bottom: 40,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ctrl.homeTitleModel.data!.eTitle![0].toString(),
                    style: AppTextStyles.semiBold.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    ctrl.homeTitleModel.data!.eTitle![1].toString(),
                    style: AppTextStyles.semiBold.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            );
          }),
          Positioned(
            bottom: 20,
            right: 0,
            child: Image.asset(
              Assets.appLogo,
              height: Get.height * 0.2,
            ),
          ),
        ],
      ),
    );
  }

  ListView listView() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        GetX<HomePageController>(
          init: HomePageController(),
          builder: (controller) {
            return controller.processing
                ? SizedBox(
                    height: Get.height * 0.5,
                    width: Get.width,
                    child: const LoadingWidget())
                : SizedBox(
                    // height: Get.height * 0.26,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: Get.height * 0.224,
                              child: PageView.builder(
                                onPageChanged: (index) =>
                                    controller.currentIndex = index,
                                itemCount: controller.sliderModel.data!.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          controller
                                              .sliderModel.data![index].eImage!,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                  );
                                },
                              ),
                            ),
                            14.verticalSpace,
                            Center(
                              child: _buildCurrentPageIndicator(
                                index: controller.sliderModel.data?.length,
                              ),
                            ),
                          ],
                        ),
                        24.verticalSpace,
                        _buildTitle(title: 'We Are Offering'),
                        12.verticalSpace,
                        Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          runSpacing: 4.0,
                          children: [
                            for (int index = 0;
                                index < controller.categoryModel.data!.length;
                                index++)
                              Container(
                                height: Get.height * 0.15,
                                width: Get.width * 0.44,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      controller
                                          .categoryModel.data![index].image!,
                                    ),
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                      kBlackColor.withOpacity(0.5),
                                      BlendMode.darken,
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Center(
                                  child: Text(
                                    controller
                                        .categoryModel.data![index].eName!,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.semiBold.copyWith(
                                      color: kWhiteColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        18.verticalSpace,
                        _buildTitle(
                          title: 'Customer Testimonials',
                        ),
                        12.verticalSpace,
                        SizedBox(
                          height: Get.height * 0.2,
                          child: PageView.builder(
                            itemCount: controller.testimonialModel.data!.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Text(
                                    controller
                                        .testimonialModel.data![index].eComment!
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.normal.copyWith(
                                      color: kCaptionTextColor,
                                      height: 2,
                                    ),
                                  ),
                                  24.verticalSpace,
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage: NetworkImage(
                                      controller
                                          .testimonialModel.data![index].image!,
                                    ),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        (Get.height * 0.15).toInt().verticalSpace,
                      ],
                    ),
                  );
          },
        ),
      ],
    );
  }

  Widget _buildTitle({String? title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title!,
        style: AppTextStyles.medium.copyWith(
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildCurrentPageIndicator({int? index}) {
    return GetX<HomePageController>(builder: (controller) {
      return AnimatedSmoothIndicator(
        activeIndex: controller.currentIndex,
        count: index!,
        effect: const ColorTransitionEffect(
          dotWidth: 8,
          dotHeight: 8,
          activeDotColor: kRedColor,
          dotColor: kInActiveColor,
        ),
      );
    });
  }
}
