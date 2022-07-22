import 'package:flutter/material.dart';
import 'package:food_delivery/dashboard/dashboard_page.dart';
import 'package:food_delivery/dashboard/home_page.dart';
import 'package:food_delivery/details/start_page.dart';
import 'package:food_delivery/order/order_page.dart';
import 'package:get/get.dart';

void main() {
  Get.put(DashboardController(), permanent: true);
  Get.put(HomePageController(), permanent: true);
  Get.put(OrderPageController(), permanent: true);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const LoadingScreen();
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        Get.offAll(const StartPage());
      },
    );
  }
}
