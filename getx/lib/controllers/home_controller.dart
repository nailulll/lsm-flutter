import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/cart_controller.dart';
import 'package:getx/models/product_model.dart';

class HomeController extends GetxController {
  final products = <ProductModel>[
    ProductModel(code: "P01", name: "Laptop", price: 1200),
    ProductModel(code: "P02", name: "Mobile", price: 500),
    ProductModel(code: "P03", name: "Tablet", price: 400),
    ProductModel(code: "P04", name: "TV", price: 430),
    ProductModel(code: "P05", name: "AC", price: 300),
    ProductModel(code: "P06", name: "Washing Machine", price: 200),
    ProductModel(code: "P07", name: "Fan", price: 100),
    ProductModel(code: "P08", name: "Speaker", price: 400),
    ProductModel(code: "P09", name: "Microwave", price: 300),
    ProductModel(code: "P10", name: "Fridge", price: 500),
    ProductModel(code: "P11", name: "Oven", price: 400),
    ProductModel(code: "P12", name: "Water Dispenser", price: 200),
  ];

  void addToCart(ProductModel product) {
    Get.find<CartController>().addToCart(product);
    Get.snackbar(
      'Info',
      '${product.name} added successfully',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 1),
    );
  }
}
