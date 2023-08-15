import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:testproject/common/global_colors.dart';
import 'package:testproject/common/global_images.dart';
import 'package:testproject/common/global_obs.dart';
import 'package:testproject/common/global_styles.dart';
import 'package:testproject/router_generator.dart';

class MainMobileScreen extends StatefulWidget {
  static MultiBlocProvider provider() {
    return MultiBlocProvider(
      providers: [
      ],
      child: const MainMobileScreen(),
    );
  }

  const MainMobileScreen({Key? key}) : super(key: key);

  @override
  State<MainMobileScreen> createState() => _MainScreenState();
}

// ignore: deprecated_member_use
class _MainScreenState extends State<MainMobileScreen> with AfterLayoutMixin {
  /// MARK: - Initials;
  final List<Widget> _screens = [
   
  ];
  int _indexTab = 0;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  DateTime? currentBackPressTime;
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime ?? now) >
                Duration(seconds: 2)) {
          currentBackPressTime = now;
          Fluttertoast.showToast(msg: "exit_warning".tr);
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        key: _globalKey,
        // drawer: Drawer(
        //   width: Get.width*0.7,
        //   child: MyDrawar(),
        // ),
        appBar: buildAppbar(context),
        body: IndexedStack(
          index: _indexTab,
          children: _screens,
        ),
        bottomNavigationBar: buildNavbar(),
      ),
    );
  }

  BottomNavigationBar buildNavbar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: 'home'.tr,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.groups),
          label: 'contacts'.tr,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.archive),
          label: 'products_bottom_bar'.tr,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.more_horiz),
          label: 'more'.tr,
        ),
      ],
      currentIndex: _indexTab,
      selectedItemColor: GlobalColors.primaryColor,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (value) {
        
      },
      type: BottomNavigationBarType.fixed,
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      title: InkWell(
        onTap: () => _globalKey.currentState!.openDrawer(),
        child: Obx(() {
          return TextIcon(
            text: '${GlobalObs.firstName.value} ${GlobalObs.lastName.value}',
            textStyle: GlobalStyles.robotoBold(context).copyWith(
              color: Colors.white,
              fontSize: 16,
            ),
            prefix: const Icon(
              Icons.location_on,
              color: Colors.white,
            ),
          );
        }),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            GlobalImages.adjustment,
            height: 22,
            width: 22,
            fit: BoxFit.cover,
            color: Colors.white,
          ),
        ),
        IconButton(
            onPressed: () {
              navigator!.pushNamed(
                RouteGenerator.mainScreen,
              );
            },
            icon: const Icon(
              Icons.chat_bubble_sharp,
              color: Colors.white,
            )),
      ],
    );
  }
}
