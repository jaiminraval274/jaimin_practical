/**
 * Created by Jaimin on 20/03/24.
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaimin_chpl_practical/Utils/Colors.dart';
import 'package:jaimin_chpl_practical/Utils/Extentions.dart';

import '../../../Utils/CustomWidget.dart';
import '../../../Utils/Height_Width.dart';
import '../../../Utils/Strings.dart';
import '../controller/cart_controller.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  var controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: CommonText(
          text: cartSummary,
          fontSize: 25,
        ),
      ),
      bottomNavigationBar: Obx(
        () => controller.cartItemList.isEmpty
            ? shrink
            : SizedBox(
                height: 135,
                child: Column(
                  children: [
                    height10,
                    const Divider(),
                    height10,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: CustomButton(
                        height: 60,
                        width: Get.width,
                        text: placeOrder,
                        textColor:whiteColor,
                      ),
                    ),
                    height20,
                  ],
                ),
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height40,
            Obx(
              () => controller.cartItemList.isEmpty
                  ? shrink
                  : CommonText(
                      text: orderSummary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
            ),
            height20,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Obx(
                  () => controller.cartItemList.isEmpty
                      ? CommonText(
                          text: emptyCart,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ).center()
                      : ListView.builder(
                          itemCount: controller.cartItemList.value.length,
                          itemBuilder: (context, index) => SizedBox(
                            height: 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: backgroundColor,
                                      ),
                                      child:
                                          const Icon(Icons.account_box_rounded),
                                    ),
                                    width15,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                          text: controller.cartItemList[index]
                                              ['itemName'],
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        height10,
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              for (var service in controller
                                                      .cartItemList[index]
                                                  ['services'])
                                                CommonText(
                                                  text: service['name'],
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      children: [
                                        CustomButton(
                                          height: 30,
                                          width: 70,
                                          text: remove,
                                          color: redColor,
                                          onTap: () {
                                            controller.cartItemList
                                                .removeAt(index);
                                            showSnackBar(
                                              isError: false,
                                              message: removeItem,
                                            );
                                          },
                                          textColor: whiteColor,
                                        ),
                                        height5,
                                        for (var service in controller
                                            .cartItemList[index]['services'])
                                          CommonText(
                                            text: '₹ ${service['price']}',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300,
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                                height10,
                              ],
                            ),
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
