import 'package:crm_new/home.dart';
import 'package:flutter/material.dart';

class ProductManagement extends StatefulWidget {
  const ProductManagement({super.key});

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Product Management',
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
                    image: 'images/businessList.png',
                    firstText: 'Business',
                    secondText: 'List'),
                GridTileofApp(
                    image: 'images/products.png',
                    firstText: 'All',
                    secondText: 'Products'),
                GridTileofApp(
                    image: 'images/categories.png',
                    firstText: 'Categories',
                    secondText: ''),
                GridTileofApp(
                    image: 'images/productsTransfer.png',
                    firstText: 'Products',
                    secondText: 'Transfer'),
                GridTileofApp(
                    image: 'images/brands.png',
                    firstText: 'Brands',
                    secondText: ''),
                GridTileofApp(
                    image: 'images/measurementUnits.png',
                    firstText: 'Measurement',
                    secondText: 'Units'),
                GridTileofApp(
                    image: 'images/warehouse.png',
                    firstText: 'Warehouses',
                    secondText: ''),
              ]),
        ),
      ),
    );
  }
}
