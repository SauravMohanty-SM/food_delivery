import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

part 'order_page.g.dart';

@swidget
Widget orderPage(BuildContext context,
    {required Map<String, dynamic> productDetails}) {
  final ctrl = Get.find<OrderPageController>();
  return Scaffold(
    backgroundColor: Colors.orange,
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.workspaces,
                      color: Colors.black,
                      size: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      padding: const EdgeInsets.only(top: 170),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  if (ctrl.itemCount.value > 1) {
                                    ctrl.itemCount.value -= 1;
                                  }
                                },
                                child: Container(
                                  height: 40,
                                  width: 30,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20))),
                                  child: const Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Obx(() {
                                return Container(
                                  height: 40,
                                  width: 30,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                  ),
                                  child: Text(
                                    ctrl.itemCount.value.toString(),
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              }),
                              InkWell(
                                onTap: () {
                                  ctrl.itemCount.value += 1;
                                },
                                child: Container(
                                  height: 40,
                                  width: 30,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child: const Text(
                                    "+",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productDetails.keys.first,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          productDetails.values
                                              .elementAt(0)["desc"],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Image(
                                          image: AssetImage(productDetails
                                              .values
                                              .elementAt(0)["descImg"]),
                                          height: 12,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    const Text(
                                      "\$",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 15,
                                          height: 1.8),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Obx(() {
                                      return Text(
                                        ((double.parse(productDetails.values
                                                    .elementAt(0)["price"])) *
                                                ctrl.itemCount.value)
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    }),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 22.0),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "4.8",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.local_fire_department_rounded,
                                  color: Colors.orange,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "150 kcal",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.watch_later,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "5-10 Min",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 22.0),
                            child: ReadMoreText(
                              'The "paragraph hamburger" is a writing organizer that visually outlines the key components of a paragraph. Topic sentence, detail sentences, and a closing sentence are the main elements of a good paragraph, and each one forms a different "piece" of the hamburger.',
                              trimLines: 3,
                              colorClickableText: Colors.red,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Read more',
                              trimExpandedText: '   Read less',
                              style: TextStyle(fontSize: 15, height: 1.5),
                              moreStyle:
                                  TextStyle(color: Colors.red, fontSize: 15),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 22),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Center(
                  child: Image(
                    image: AssetImage(
                      productDetails.values.elementAt(0)["bigSize"],
                    ),
                    height: 300,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class OrderPageController extends GetxController {
  final itemCount = 1.obs;
}
