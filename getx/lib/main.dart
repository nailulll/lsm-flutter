import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controllers/home_controller.dart';
import 'package:getx/screens/cart_screen.dart';
import 'package:getx/screens/home_screen.dart';

import 'controllers/cart_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => const HomeScreen(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => HomeController());
            Get.lazyPut(() => CartController());
          }),
        ),
        GetPage(
          name: "/cart",
          page: () => const CartScreen(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => CartController());
          }),
        ),
      ],
    );
  }
}
