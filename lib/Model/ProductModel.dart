/**
 * Created by Jaimin on 20/03/24.
 */
// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  List<Category>? categories;
  List<SubCategory>? subCategories;
  List<Product>? products;
  List<Service>? services;
  String? status;
  String? message;

  ProductModel({
    this.categories,
    this.subCategories,
    this.products,
    this.services,
    this.status,
    this.message,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    subCategories: json["sub_categories"] == null ? [] : List<SubCategory>.from(json["sub_categories"]!.map((x) => SubCategory.fromJson(x))),
    products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    services: json["services"] == null ? [] : List<Service>.from(json["services"]!.map((x) => Service.fromJson(x))),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "sub_categories": subCategories == null ? [] : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
    "services": services == null ? [] : List<dynamic>.from(services!.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class Category {
  String? categoryId;
  String? categoryName;
  String? categoryPhoto;

  Category({
    this.categoryId,
    this.categoryName,
    this.categoryPhoto,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    categoryPhoto: json["category_photo"],
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "category_photo": categoryPhoto,
  };
}

class Product {
  String? productId;
  String? subCategoryId;
  String? productName;
  String? productPhoto;

  Product({
    this.productId,
    this.subCategoryId,
    this.productName,
    this.productPhoto,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    subCategoryId: json["sub_category_id"],
    productName: json["product_name"],
    productPhoto: json["product_photo"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "sub_category_id": subCategoryId,
    "product_name": productName,
    "product_photo": productPhoto,
  };
}

class Service {
  String? serviceId;
  String? serviceName;
  String? serviceBasePrice;
  String? serviceIcon;
  String? serviceActiveStatus;

  Service({
    this.serviceId,
    this.serviceName,
    this.serviceBasePrice,
    this.serviceIcon,
    this.serviceActiveStatus,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    serviceId: json["service_id"],
    serviceName: json["service_name"],
    serviceBasePrice: json["service_base_price"],
    serviceIcon: json["service_icon"],
    serviceActiveStatus: json["service_active_status"],
  );

  Map<String, dynamic> toJson() => {
    "service_id": serviceId,
    "service_name": serviceName,
    "service_base_price": serviceBasePrice,
    "service_icon": serviceIcon,
    "service_active_status": serviceActiveStatus,
  };
}

class SubCategory {
  String? subCategoryId;
  String? serviceIds;
  String? regularPrices;
  String? parentCategoryId;
  String? subCategoryName;
  String? subCategoryPhoto;

  SubCategory({
    this.subCategoryId,
    this.serviceIds,
    this.regularPrices,
    this.parentCategoryId,
    this.subCategoryName,
    this.subCategoryPhoto,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    subCategoryId: json["sub_category_id"],
    serviceIds: json["service_ids"],
    regularPrices: json["regular_prices"],
    parentCategoryId: json["parent_category_id"],
    subCategoryName: json["sub_category_name"],
    subCategoryPhoto: json["sub_category_photo"],
  );

  Map<String, dynamic> toJson() => {
    "sub_category_id": subCategoryId,
    "service_ids": serviceIds,
    "regular_prices": regularPrices,
    "parent_category_id": parentCategoryId,
    "sub_category_name": subCategoryName,
    "sub_category_photo": subCategoryPhoto,
  };
}
