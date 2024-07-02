import 'package:add_to_cart/addtocart.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> fruits = [
      {
        'image': Image.asset("assets/images/apple.png"),
        'name': 'Apple',
        'price': 80
      },
      {
        'image': Image.asset("assets/images/bananas.png"),
        'name': 'Bananas',
        'price': 20
      },
      {
        'image': Image.asset("assets/images/kiwi.png"),
        'name': 'Kiwi',
        'price': 70
      },
      {
        'image': Image.asset("assets/images/lime.png"),
        'name': 'Lime',
        'price': 90
      },
      {
        'image': Image.asset("assets/images/mango.png"),
        'name': 'Mango',
        'price': 50
      },
      {
        'image': Image.asset("assets/images/orange.png"),
        'name': 'Orange',
        'price': 40
      },
      {
        'image': Image.asset("assets/images/pineapple.png"),
        'name': 'Pineapple',
        'price': 30
      },
      {
        'image': Image.asset("assets/images/walnut.png"),
        'name': 'Nuts',
        'price': 40
      },
      {
        'image': Image.asset("assets/images/watermelon.png"),
        'name': 'Watermelon',
        'price': 90
      },
    ];

    List<Map<String, dynamic>> fruits2 = [];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child:IconButton(onPressed: (
              
            ){Get.to(AddtoCart());}, icon:Icon(Icons.shopping_cart)),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          final fruit = fruits[index];
          // final isInCart;

          return ListTile(
            onTap: () {
              
                fruits2.add({
                  'image': fruit['image'],
                  'name': fruit['name'],
                  'price': fruit['price'],
                });
                setState(() {});
              

              print([index][index]);
            },
            leading: fruit['image'],
            title: Text(
              fruit['name'].toString(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Rs " + fruit['price'].toString() + "/kg",
              style: TextStyle(fontWeight: FontWeight.w400, color: Colors.red),
            ),
            trailing:fruits2.any((element) => element['name'] == fruit['name'])
                ? Icon(Icons.done)
                : Container(
                    width: 100,
                    height: 30,
                    child: Center(child: Text("Add to Cart")),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
