import 'package:flutter/material.dart';
import 'package:food_delivery/dashboard/dashboard_page.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

part 'start_page.g.dart';

@swidget
Widget startPage(BuildContext context) {
  final pageController = PageController();
  return Scaffold(
    backgroundColor: Colors.white,
    body: SingleChildScrollView(
      child: Column(
        children: [
          Image(
            image: const AssetImage("assets/images/man.jpg"),
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "The Fastest In",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: const [
              Spacer(),
              Text(
                "Delivery",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 31,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "Food",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 31,
                ),
              ),
              Spacer(),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Our job is to filling your tummy with\ndelicious food and fast delivery",
            maxLines: 2,
            style: TextStyle(
              height: 1.5,
              color: Colors.black,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 22,),
          SmoothPageIndicator(
            controller: pageController, // PageController
            count: 3,
            effect: WormEffect(
              activeDotColor: Colors.yellow,
              dotColor: const Color(0xff7f8c8d).withOpacity(0.5),
              dotHeight: 8,
              dotWidth: 12,
            ), // your preferred effect
          ),
          const SizedBox(height: 22,),
          InkWell(
            onTap: () {
              Get.to(const DashboardPage());
            },
            child: Container(
              height: 50,
              width: 200,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xffe74c3c),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
