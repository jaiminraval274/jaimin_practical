/**
 * Created by Jaimin on 20/03/24.
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaimin_chpl_practical/Utils/CustomWidget.dart';
import 'package:jaimin_chpl_practical/Utils/Extentions.dart';
import 'package:jaimin_chpl_practical/Utils/Height_Width.dart';
import 'package:jaimin_chpl_practical/Utils/bounce_widget.dart';
import 'package:jaimin_chpl_practical/routes/app_pages.dart';

import '../../../Model/ProductModel.dart';
import '../../../Utils/Colors.dart';
import '../../../Utils/Strings.dart';
import '../controller/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  var homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CommonText(
          text: products,
          fontSize: 25,
        ),
        actions: [
          Bouncing(
            onPress: () => Get.toNamed(Routes.CART),
            child: const Icon(Icons.shopping_cart),
          ),
          width15,
        ],
      ),
      body: Obx(
        () => homeController.isLoading.value
            ? const CircularProgressIndicator().center()
            : homeController.productList.isEmpty
                ? CommonText(
                    text: noProduct,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ).center()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeController.productList.length,
                    itemBuilder: (context, i) {
                      return ExpansionTile(
                        backgroundColor: whiteColor,
                        collapsedBackgroundColor: whiteColor,
                        visualDensity: VisualDensity.adaptivePlatformDensity,
                        initiallyExpanded: true,
                        maintainState: true,
                        title: CommonText(
                          text:
                              homeController.productList[i].categoryName ?? '',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <Widget>[
                          const Divider(),
                          Column(
                            children: _buildExpandableContent(
                                homeController.productSubCatList),
                          ),
                          height5,
                        ],
                      );
                    },
                  ),
      ),
    );
  }

  _buildExpandableContent(List<SubCategory> subCategory) {
    List<Widget> columnContent = [];

    for (var content in subCategory) {
      columnContent.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: ListTile(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            title: CommonText(
              text: content.subCategoryName ?? '',
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            leading: Image.network(
              content.subCategoryPhoto ?? '',
            ),
            trailing: CustomButton(
              text: add,
              onTap: () {
                homeController!.itemIdList.value.clear();
                homeController!.servicesItemList.value.clear();
                showServicesDialog(
                  services: homeController.serviceList.value,
                  homeController: homeController,
                  item: content,
                );
              },
              textColor: Colors.white,
              color: Colors.indigo,
            ),
          ),
        ),
      );
    }

    return columnContent;
  }
}
