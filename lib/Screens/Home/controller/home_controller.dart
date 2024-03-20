/**
 * Created by Jaimin on 20/03/24.
 */
import 'package:get/get.dart';

import '../../../ApiManager/ApiServices.dart';
import '../../../Model/ProductModel.dart';
import '../../../Utils/ConsoleLog.dart';
import '../../Cart/controller/cart_controller.dart';

class HomeController extends GetxController {
  var productList = <Category>[].obs;
  var productSubCatList = <SubCategory>[].obs;
  var serviceList = <Service>[].obs;
  var isLoading = true.obs;
  var itemIdList = [].obs, servicesItemList = [].obs;
  var cartController = Get.put(CartController());
  @override
  void onInit() {
    loadProduct();
    super.onInit();
  }

  void loadProduct() async {
    var response = await ApiServices.ApiProvider(0);
    try {
      var data = productModelFromJson(response);
      if (data.status == '200') {
        productList.value = data.categories!;
        productSubCatList.value = data.subCategories!;
        serviceList.value = data.services!;
        Console.Log(
            'loadProductResponse', data.categories![0].categoryName ?? '');
        isLoading.value = false;
      } else {
        Console.Log('loadProductError', 'Error from API:- ${data.status}');
      }
    } catch (e) {
      isLoading.value = false;
      Console.Log('loadProductError', e);
    }
  }
}
