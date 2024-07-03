import 'package:add_to_cart/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCart extends StatelessWidget {
  final Controlerfruit controller = Get.find<Controlerfruit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.cart.length,
        itemBuilder: (context, index) {
          final item = controller.cart[index];
          return ListTile(
            leading: Image.asset(item['image'], width: 50, height: 50),
            title: Text(item['name']),
            subtitle: Text("Rs ${item['price']}/kg"),
             trailing: ElevatedButton(
                          onPressed: () => controller.removeToCart(index),
                          child: Text("Remove"),
                        ),
          );
        },
      )),
    );
  }
}