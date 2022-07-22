import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_delivery/order/order_page.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:get/get.dart';

part 'home_page.g.dart';

final categories = {
  "Burger": "assets/images/bur.png",
  "Pizza": "assets/images/pizza.png",
  "Dumplings": "assets/images/dum.png",
  "Char Siu": "assets/images/char.png",
  "Chow Mein": "assets/images/chaw.png"
};

final productList = {
  "Beef Burger": {
    "image": "assets/images/bur.png",
    "desc": "Cheesy Mozarella",
    "price": "6.59",
    "descImg": "assets/images/bur.png",
    "bigSize": "assets/images/obur1.png"
  },
  "Double Burger": {
    "image": "assets/images/bura.png",
    "desc": "Double Beef",
    "price": "7.49",
    "descImg": "assets/images/bura.png",
    "bigSize": "assets/images/obur2.png"
  },
  "Pizza Burger": {
    "image": "assets/images/burb.png",
    "desc": "Double Cheese",
    "price": "4.29",
    "descImg": "assets/images/burb.png",
    "bigSize": "assets/images/obur1.png"
  }
};

@swidget
Widget homePage(BuildContext context) {
  final ctrl = Get.find<HomePageController>();
  return Obx(() {
    return Scaffold(
      backgroundColor: const Color(0xfff5f6fa),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color(0xffFCF6F8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Image(
                          height: 25,
                          width: 25,
                          image: AssetImage("assets/images/menu.jpg"),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.red,
                        size: 18,
                      ),
                      const Text(
                        "California, US",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color(0xffFCF6F8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Image(
                          height: 25,
                          width: 25,
                          image: AssetImage("assets/images/face.png"),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 150,
                  margin: const EdgeInsets.only(right: 30),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange.withOpacity(0.5),
                        Colors.yellow.withOpacity(0.5)
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 22.0),
                        child: Column(
                          children: [
                            const Spacer(),
                            const Text(
                              "The Fastest In",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: const [
                                Text(
                                  "Delivery",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  " Food",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Get.snackbar("Sorry...", "Available Soon...");
                              },
                              child: Container(
                                height: 35,
                                width: 100,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Text(
                                  "Order Now",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 22.0),
                        child: Image(
                          image: AssetImage("assets/images/de.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 22,
                ),
                SizedBox(
                  height: 55,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          ctrl.selectedItem.value = index;
                        },
                        child: Obx(() {
                          return Container(
                            height: 45,
                            width: 130,
                            decoration: BoxDecoration(
                              color: ctrl.selectedItem.value == index
                                  ? Colors.red
                                  : Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Row(
                              children: [
                                const Spacer(),
                                Container(
                                  height: 30,
                                  width: 30,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: ctrl.selectedItem.value == index
                                          ? Colors.white
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                          image: AssetImage(
                                        categories.values.elementAt(index),
                                      ))),
                                ),
                                const Spacer(),
                                Text(
                                  categories.keys.elementAt(index),
                                  style: TextStyle(
                                    color: ctrl.selectedItem.value == index
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          );
                        }),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 15,
                      );
                    },
                    itemCount: categories.length,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                if (ctrl.selectedItem.value == 0)
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: Row(
                      children: [
                        const Text(
                          "Popular Now",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          "View All",
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          height: 13,
                          width: 13,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 8,
                          ),
                        )
                      ],
                    ),
                  ),
                if (ctrl.selectedItem.value == 0)
                  const SizedBox(
                    height: 23,
                  ),
                if (ctrl.selectedItem.value == 0)
                  SizedBox(
                    height: 200,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              final product = {
                                productList.keys.elementAt(index):
                                    productList.values.elementAt(index)
                              };
                              Get.to(OrderPage(
                                productDetails: product,
                              ));
                            },
                            child: Container(
                              height: 145,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage(
                                      productList.values
                                          .elementAt(index)["image"]!,
                                    ),
                                    height: 100,
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    productList.keys.elementAt(index),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      Text(
                                        productList.values
                                            .elementAt(index)["desc"]!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                      Image(
                                        image: AssetImage(
                                          productList.values
                                              .elementAt(index)["descImg"]!,
                                        ),
                                        height: 12,
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      const Spacer(),
                                      const Text(
                                        "\$",
                                        style: TextStyle(
                                          height: 1.8,
                                          color: Colors.red,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        productList.values
                                            .elementAt(index)["price"]!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            width: 15,
                            color: Colors.transparent,
                          );
                        },
                        itemCount: 3),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  });
}

class HomePageController extends GetxController {
  final selectedItem = 0.obs;
}
