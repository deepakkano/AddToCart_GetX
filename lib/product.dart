import 'package:add_to_cart/addtocart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    Controlerfruit  furitcontroler=Get.put(Controlerfruit());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child:IconButton(onPressed: () {
    Get.to(() => AddToCart());
  },
  icon: Icon(Icons.shopping_cart)),
          )
        ],
      ),
      body:Obx(() =>  ListView.builder(
        itemCount:furitcontroler.fruits.length,
        itemBuilder: (context, index) {
          final fruit = furitcontroler.fruits[index];
 bool incart=furitcontroler.cart.any((item) => item['name'] == fruit['name']);

          return Card(
            child: SizedBox(
              height: 100,
              child: ListTile(
                
                leading: Image.asset(fruit['image']),
                title: Text(
                  fruit['name'].toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Rs " + fruit['price'].toString() + "/kg",
                  style: TextStyle(fontWeight: FontWeight.w400, color: Colors.red),
                ),
                 trailing: incart
                      ? Icon(Icons.done, color: Colors.green)
                      : ElevatedButton(
                          onPressed: () => furitcontroler.addToCart(index),
                          child: Text("Add to Cart"),
                        ),
              ),
            ),
          );
        },
      ),)
    );
  }
}




class Controlerfruit extends GetxController{

final List<Map<String, dynamic>> fruits = [
      {
        'image': "assets/images/apple.png",
        'name': 'Apple',
        'price': 80
      },
      {
        'image': "assets/images/bananas.png",
        'name': 'Bananas',
        'price': 20
      },
      {
        'image': "assets/images/kiwi.png",
        'name': 'Kiwi',
        'price': 70
      },
      {
        'image': "assets/images/lime.png",
        'name': 'Lime',
        'price': 90
      },
      {
        'image': "assets/images/mango.png",
        'name': 'Mango',
        'price': 50
      },
      {
        'image': "assets/images/orange.png",
        'name': 'Orange',
        'price': 40
      },
      {
        'image': "assets/images/pineapple.png",
        'name': 'Pineapple',
        'price': 30
      },
      {
        'image':"assets/images/walnut.png",
        'name': 'Nuts',
        'price': 40
      },
      {
        'image': "assets/images/watermelon.png",
        'name': 'Watermelon',
        'price': 90
      },
    ].obs;

  final RxList<Map<String, dynamic>> cart = <Map<String, dynamic>>[].obs;

  void addToCart(int index) {
    final fruit = fruits[index];
     if (cart.any((fruititem) => fruititem['name'] == fruit['name'])) {
      Get.snackbar(
        'Already in Cart',
        '${fruit['name']} is already in the cart!',
        duration: Duration(seconds: 2),
      );
    } else {
      cart.add(fruit);
    }
  }

void removeToCart(int index){
      final fruit = fruits[index];

  cart.remove(fruit);
}

}