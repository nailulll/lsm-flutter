import 'package:get/get.dart';
import 'package:getx/models/product_model.dart';

class CartModel {
  Rx<int> quantity;
  ProductModel product;

  CartModel({required this.product, int quantity = 1})
      : quantity = RxInt(quantity);
}
