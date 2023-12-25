import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Product name')),
                          DataColumn(label: Text('Product code')),
                          DataColumn(label: Text('Actual price')),
                          DataColumn(label: Text('Sale price')),
                          DataColumn(label: Text('Category')),
                          DataColumn(label: Text('Stock quantity')),
                          DataColumn(label: Text('Thumbnail')),
                          DataColumn(label: Text('Brand')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: List<DataRow>.generate(
                          8,
                          (index) {
                            return DataRow(cells: [
                              const DataCell(
                                Center(
                                  child: Text('MAC Book'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('250'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('1200'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('1300'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('Apple'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('7'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('Mohsin'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('Apple'),
                                ),
                              ),
                              DataCell(Center(
                                child: PopupMenuButton(
                                    itemBuilder: (context) => [
                                          PopupMenuItem(
                                              value: 1,
                                              child: const Text('Edit'),
                                              onTap: () {}),
                                          PopupMenuItem(
                                            value: 2,
                                            child: const Text('View'),
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  '/viewRecurringInvoices');
                                            },
                                          ),
                                          PopupMenuItem(
                                            value: 3,
                                            child: const Text('Delete'),
                                            onTap: () {},
                                          )
                                        ]),
                              ))
                            ]);
                          },
                        )),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
