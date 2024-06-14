import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/models/product_model.dart';

import '../models/cart_model.dart';

class CartController extends GetxController {
  var carts = RxList<CartModel>([]);
  var totalPrice = 0.0.obs;

  void addToCart(ProductModel product) {
    totalPrice.value += product.price;
    var productExist = carts.firstWhereOrNull(
      (cart) => cart.product.code == product.code,
    );
    if (productExist != null) {
      productExist.quantity.value++;
      return;
    }
    carts.add(CartModel(quantity: 1, product: product));
  }

  void removeFromCart(int index) {
    carts[index].quantity.value--;
    totalPrice.value -= carts[index].product.price;
    if (carts[index].quantity.value == 0) {
      carts.removeAt(index);
    }
  }

  void checkout() {
    if (carts.isEmpty) return;

    Get.defaultDialog(
      title: "Loading...",
      content: const CircularProgressIndicator(),
    );
    Future.delayed(const Duration(seconds: 2), () {
      carts.clear();
      totalPrice.value = 0.0;
      Get.back();
      Get.snackbar(
        'Info',
        'Checkout successfully',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 2),
      );
    });
  }
}
