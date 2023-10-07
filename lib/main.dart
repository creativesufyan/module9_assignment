import 'package:flutter/material.dart';
import 'package:module9_assignment/cart_page.dart';
import 'package:module9_assignment/test_code.dart';

void main() => runApp(MyApp());

class Product {
  String name;
  double unitPrice;

  Product({required this.name, required this.unitPrice});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      home: CartPaged(),
      // home: CartPage(),
      // home: ShoppingCart(),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int quantity = 0;
  double totalAmount = 0.0;

  void increaseQuantity() {
    setState(() {
      quantity++;
      calculateTotalAmount();
    });
  }

  void decreaseQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
        calculateTotalAmount();
      });
    }
  }

  void calculateTotalAmount() {
    setState(() {
      totalAmount = quantity * 51.0; // Assuming the unit price is $51
    });
  }

  void showSnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Congratulations! Your order has been placed.'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text(
          'Shopping App',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.search, color: Colors.black),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 20,
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2e_6o-iMAufqp5DT9GnBrmAIzuEhqAYRh5A&usqp=CAU'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 65,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Pullover",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Color: ",
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                              Text("Red"),
                              SizedBox(width: 20),
                              Text(
                                "Size: ",
                                style: TextStyle(
                                  color: Colors.black45,
                                ),
                              ),
                              Text("L"),
                            ],
                          ),
                          Row(
                            children: [
                              Card(
                                shape: CircleBorder(),
                                child: SizedBox(
                                  width: 35,
                                  height: 35,
                                  child: IconButton(
                                    color: Colors.black45,
                                    icon: const Icon(
                                      Icons.remove,
                                      size: 20,
                                    ),
                                    onPressed: decreaseQuantity,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '$quantity',
                                style: TextStyle(fontSize: 15),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Card(
                                shape: CircleBorder(),
                                child: SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: IconButton(
                                    color: Colors.black45,
                                    icon: const Icon(
                                      Icons.add,
                                      size: 20,
                                    ),
                                    onPressed: increaseQuantity,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_vert,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("\$51")
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  onPressed: () {
                    showSnackbar(context);
                  },
                  child: Text(' CHECK OUT'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
