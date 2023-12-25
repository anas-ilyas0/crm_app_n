import 'package:crm_new/home.dart';
import 'package:flutter/material.dart';

class CartOrders extends StatefulWidget {
  const CartOrders({super.key});

  @override
  State<CartOrders> createState() => _CartOrdersState();
}

class _CartOrdersState extends State<CartOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Sales',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.4),
              children: const [
                GridTileofApp(
                    image: 'images/listOrders.png',
                    firstText: 'List',
                    secondText: 'Orders'),
                GridTileofApp(
                    image: 'images/placeOrder.png',
                    firstText: 'Place',
                    secondText: 'New Order'),
              ]),
        ),
      ),
    );
  }
}
