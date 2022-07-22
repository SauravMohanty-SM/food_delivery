import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_delivery/dashboard/home_page.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:get/get.dart';

part 'dashboard_page.g.dart';

@hwidget
Widget dashboardPage(BuildContext context) {
  final tabController = useTabController(initialLength: 5);
  final pageIndex = useState(0);
  final ctrl = Get.find<DashboardController>();

  return Scaffold(
    bottomNavigationBar: BottomNav(
      onItemTap: (index) {
        pageIndex.value = index;
        tabController.animateTo(
          index,
          duration: const Duration(microseconds: 200),
          curve: Curves.easeIn,
        );
      },
      selectedIndex: pageIndex.value,
    ),
    body: TabBarView(
      controller: tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        HomePage(),
        SizedBox(),
        SizedBox(),
        SizedBox(),
        SizedBox(),
      ].map((e) => ClipRect(child: e)).toList(),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    floatingActionButton: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 72, maxWidth: 72),
        child: FloatingActionButton.large(
          backgroundColor: Colors.red,
          onPressed: () {
            // ctrl.isSearchSelected.value = true;
            pageIndex.value = 2;
            tabController.animateTo(
              2,
              duration: const Duration(milliseconds: 200),
            );
          },
          child: const Icon(Icons.search, size: 40),
          elevation: 0.0,
        ),
      ),
    ),
  );
}

@swidget
Widget bottomNav({
  required int selectedIndex,
  required ValueChanged<int> onItemTap,
}) {
  return BottomAppBar(
    color: Colors.transparent,
    shape: const CircularNotchedRectangle(),
    elevation: 32,
    child: Stack(
      children: [
        BottomNavigationBar(
          unselectedFontSize: 10,
          selectedFontSize: 12,
          backgroundColor: const Color(0xfff5f6fa),
          selectedItemColor: Colors.redAccent,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: selectedIndex,
          onTap: (index) => index != 2 ? onItemTap(index) : null,
          items: [
            _buildItem(Icons.home, selectedIndex == 0),
            _buildItem(
                Icons.favorite_border, selectedIndex == 1),
            _buildItem(null, false),
            _buildItem(
                Icons.notifications_none, selectedIndex == 3),
            _buildItem(Icons.shopping_cart_outlined, selectedIndex == 4),
          ],
        ),
        Positioned(
          child: const AbsorbPointer(absorbing: true, child: SizedBox()),
          top: 0,
          bottom: 0,
          left: Get.width / 5 * 2,
          right: Get.width / 5 * 2,
        ),
      ],
    ),
  );
}

BottomNavigationBarItem _buildItem(
    IconData? icon, bool selected) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.only( top: 4),
      child: icon == null
          ? null
          : Icon(
              icon,
              color: selected ? Colors.redAccent : null,
            ),
    ),
    label: ""
  );
}

class DashboardController extends GetxController {

}
