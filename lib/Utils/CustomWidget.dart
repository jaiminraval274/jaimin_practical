/**
 * Created by Jaimin on 20/03/24.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaimin_chpl_practical/Model/ProductModel.dart';
import 'package:jaimin_chpl_practical/Screens/Home/controller/home_controller.dart';
import 'package:jaimin_chpl_practical/Utils/Colors.dart';
import 'package:jaimin_chpl_practical/Utils/ConsoleLog.dart';
import 'package:jaimin_chpl_practical/Utils/Height_Width.dart';

import 'Strings.dart';
import 'bounce_widget.dart';

class CommonText extends StatelessWidget {
  String? text;
  Color? textColor;
  double? fontSize;
  int? maxLine;
  FontWeight? fontWeight;
  TextOverflow? textOverflow;
  bool? softWrap;

  CommonText({
    super.key,
    this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.maxLine,
    this.textOverflow,
    this.softWrap,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      maxLines: maxLine,
      overflow: textOverflow,
      softWrap: softWrap,
    );
  }
}

class CustomButton extends StatelessWidget {
  String? text;
  Function()? onTap;
  Color? color, textColor;
  double? height, width;

  CustomButton({
    super.key,
    this.text,
    this.onTap,
    this.height = 40,
    this.width = 100,
    this.color = Colors.indigo,
    this.textColor = Colors.indigo,
  });

  @override
  Widget build(BuildContext context) {
    return Bouncing(
      onPress: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: CommonText(
          text: text!,
          textColor: textColor,
        ),
      ),
    );
  }
}

showServicesDialog({
  List<Service>? services,
  HomeController? homeController,
  SubCategory? item,
}) {
  showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (context) => Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          height15,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                Bouncing(
                  onPress: () {
                    homeController!.itemIdList.value.clear();
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                width50,
                CommonText(
                  text: bookService,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          height20,
          Container(
            height: 300,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: GridView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: services!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 10 / 8,
              ),
              itemBuilder: (context, index) => GetBuilder<HomeController>(
                builder: (controller) => Bouncing(
                  onPress: () {
                    if (homeController.itemIdList.value
                        .contains(services[index].serviceId)) {
                      homeController.itemIdList.value
                          .remove(services[index].serviceId);
                      homeController.servicesItemList.value.remove(
                          {'name': services[index].serviceName, 'price': '10'});
                    } else {
                      homeController!.itemIdList.value
                          .add(services[index].serviceId);
                      homeController.servicesItemList.value.add(
                          {'name': services[index].serviceName, 'price': '10'});
                    }
                    controller.update();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: homeController!.itemIdList.value
                              .contains(services[index].serviceId)
                          ? Colors.blueAccent.withOpacity(0.3)
                          :whiteColor,
                      border: Border.all(
                        color: homeController!.itemIdList.value
                                .contains(services[index].serviceId)
                            ? Colors.blueAccent
                            : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: backgroundColor,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(15),
                          child: Image.network(
                            services[index].serviceIcon!,
                            height: 35,
                            width: 35,
                          ),
                        ),
                        width10,
                        Flexible(
                          child: CommonText(
                            text: services[index].serviceName,
                            fontSize: 16,
                            softWrap: true,
                            maxLine: 2,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 5),
            child: CustomButton(
              text: submit,
              width: Get.width,
              textColor: whiteColor,
              onTap: () {
                homeController!.cartController.cartItemList.add({
                  "itemName": item!.subCategoryName ?? '',
                  "services": homeController!.servicesItemList.value,
                });
                Console.Log(
                    'services', homeController!.servicesItemList.value.length);

                Get.back();
                showSnackBar(
                  isError: false,
                  message: addItem,
                );
              },
            ),
          ),
          height20,
        ],
      ),
    ),
  );
}

void showSnackBar({bool? isError, var message}) {
  if (isError!) {
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: whiteColor,
            insetPadding: const EdgeInsets.only(left: 20, right: 20),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: SizedBox(
              width: 350,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  height15,
                  const FlutterLogo(),
                  height5,
                  CommonText(
                    text: 'Error',
                    fontSize: 16,
                  ),
                  height5,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: CommonText(
                      text: message,
                      fontSize: 13,
                    ),
                  ),
                  height10,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: CustomButton(
                      text: 'Ok',
                      onTap: Get.back,
                    ),
                  ),
                  height15,
                ],
              ),
            ),
          );
        });
  } else {
    Get.snackbar(
      isError == true ? 'failed' : 'success',
      message,
      icon: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5),
        child: Icon(
          isError == true ? Icons.cancel : Icons.done,
          color: isError == true ? Colors.red : Colors.green,
        ),
      ),
      backgroundColor: whiteColor,
      snackPosition: SnackPosition.BOTTOM,
      borderColor: isError == true ? Colors.red : Colors.green,
      borderWidth: 4,
      colorText: isError == true ? Colors.red : Colors.green,
      duration: Duration(seconds: isError == true ? 3 : 2),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
    );
  }
}
