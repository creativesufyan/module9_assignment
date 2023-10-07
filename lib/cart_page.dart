import 'package:flutter/material.dart';

void main() {
  runApp(CartPage());
}

class CartPage extends StatefulWidget {
  const CartPage({Key? key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<String> imageUrls = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRG6irkJxaSuqlVlxoLh_zoALI8zZXAh4b0DQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR04w9eHjDMBwb0Rb3Qd7G3ewq45ib8LXYXKQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUx5luXIh1X0D3jVZbD9LUN71B4FdfctBJ7w&usqp=CAU",
  ];

  List<int> unitPrice = [50, 40, 35];
  List<String> productName = ["Panjabi", "Shirt", "T-shirt"];
  List<String> productSize = ["M", "L", "L"];
  List<int> unitQuantities = [1, 0, 0]; // Initialize quantities to 1

  int totalAmount = 0;

  @override
  void initState() {
    super.initState();
    _calculateTotalPrice();
  }

  void _calculateTotalPrice() {
    int total = 0;
    for (int i = 0; i < unitPrice.length; i++) {
      total += unitPrice[i] * unitQuantities[i];
    }
    setState(() {
      totalAmount = total;
    });
  }

  void _incrementQuantity(int index) {
    setState(() {
      unitQuantities[index]++;
      _calculateTotalPrice();
    });
  }

  void _decrementQuantity(int index) {
    if (unitQuantities[index] > 0) {
      setState(() {
        unitQuantities[index]--;
        _calculateTotalPrice();
      });
    }
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
      appBar:
          AppBar(elevation: 0, backgroundColor: Colors.transparent, actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            Text(
              "Shopping Cart",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 80.0,
                        width: 80.0,
                        child: Center(
                          child: Container(
                            height: 80,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.blue[100],
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(imageUrls[index]),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${productName[index]}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Color:Red   Size:${productSize[index]}",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black87,
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      size: 15,
                                      color: Colors.black87,
                                    ),
                                    onPressed: () {
                                      _decrementQuantity(index);
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "${unitQuantities[index]}",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                width: 33,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey[300],
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      size: 15,
                                      color: Colors.black87,
                                    ),
                                    onPressed: () {
                                      _incrementQuantity(index);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.more_vert,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("\$ ${unitPrice[index]}")
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
                Text(
                  'Total Amount:',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  " \$${totalAmount.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize:20,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  showSnackbar(context);
                },
                child: Text("SHOP NOW"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
