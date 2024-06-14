import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/cart_controller.dart';
import 'package:getx/controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'State Management GetX - Page Home',
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(controller.products[index].name),
            subtitle: Text('\$${controller.products[index].price}'),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                controller.addToCart(controller.products[index]);
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(height: 0);
        },
        itemCount: controller.products.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed("/cart"),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(Icons.shopping_cart_outlined),
            Obx(() {
              var carts = Get.find<CartController>().carts;
              if (carts.isEmpty) {
                return const SizedBox();
              }
              return Positioned(
                right: -5,
                top: -5,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 8,
                  child: Obx(() {
                    return Text(
                      carts.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
