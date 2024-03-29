// ignore_for_file: file_names, avoid_print
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crm_new/models/products_get.dart';
import 'package:crm_new/resources/components/app_url.dart';

Future<List<Data>> getProducts() async {
  String token = AppUrl.token;
  String productsURL = AppUrl.productsURL;
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${token}'
  };
  var url = Uri.parse(productsURL);

  try {
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      ProductsModel getProducts = ProductsModel.fromJson(jsonResponse);
      print('Successfully Fetched Data');
      return getProducts.data;
    } else {
      print(
          'Error: (statusCode ${response.statusCode}, reasonPhrase: ${response.reasonPhrase})');
      return [];
    }
  } catch (e) {
    print('Exception occurred: $e');
    return [];
  }
}

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  late Future<List<Data>> futureData;
  @override
  void initState() {
    super.initState();
    futureData = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text(
              'All Products',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addProduct');
                  },
                  icon: const Icon(
                    Icons.add_circle_rounded,
                    color: Colors.white,
                  ))
            ]),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            FutureBuilder<List<Data>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Expanded(
                    child: Center(child: Text('Error: ${snapshot.error}')),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Expanded(
                    child: Center(child: Text('No data available.')),
                  );
                }
                return Expanded(
                    child: SingleChildScrollView(
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Product name')),
                          DataColumn(label: Text('Business name')),
                          DataColumn(label: Text('Product code')),
                          DataColumn(label: Text('Actual price')),
                          DataColumn(label: Text('Sale price')),
                          DataColumn(label: Text('Category')),
                          DataColumn(label: Text('Stock quantity')),
                          DataColumn(label: Text('Thumbnail')),
                          DataColumn(label: Text('Brand')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: snapshot.data!
                            .map((data) => DataRow(cells: [
                                  DataCell(Text(data.name)),
                                  DataCell(Text(
                                      data.business?.businessName ?? 'null')),
                                  DataCell(Text(data.productCode)),
                                  DataCell(
                                      Text('\$${data.actualPrice.toString()}')),
                                  DataCell(
                                      Text('\$${data.salePrice.toString()}')),
                                  DataCell(Text(data.category.isNotEmpty
                                      ? data.category
                                          .map((category) => category.name)
                                          .join(', ')
                                      : 'null')),
                                  DataCell(Text(data.stockQuantity.toString())),
                                  DataCell(Text(data.thumbnail)),
                                  DataCell(Text(data.brand)),
                                  DataCell(Center(
                                    child: PopupMenuButton(
                                      itemBuilder: (context) => const [
                                        PopupMenuItem(
                                          value: 1,
                                          child: Text('Edit'),
                                        ),
                                        PopupMenuItem(
                                          value: 2,
                                          child: Text('View'),
                                        ),
                                        PopupMenuItem(
                                          value: 2,
                                          child: Text('Delete'),
                                        )
                                      ],
                                      onSelected: (value) async {
                                        if (value == 1) {
                                          Navigator.pushNamed(
                                              context, '/editProduct');
                                        }
                                        if (value == 2) {}
                                      },
                                    ),
                                  )),
                                ]))
                            .toList(),
                      ),
                    ),
                  ),
                ));
              },
            ),
          ]),
        ));
  }
}
