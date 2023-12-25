// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Invoices extends StatefulWidget {
  const Invoices({super.key});

  @override
  State<Invoices> createState() => _InvoicesState();
}

class _InvoicesState extends State<Invoices> {
  // final List<Map<String, String>> data = [
  // {'Name': 'John', 'Age': '25', 'Role': 'Developer'},
  // {'Name': 'Alice', 'Age': '30', 'Role': 'Designer'},
  // {'Name': 'Bob', 'Age': '28', 'Role': 'Manager'},
  // ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
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
                'Invoices',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/newInvoice');
                    },
                    icon: const Icon(
                      Icons.add_circle_rounded,
                      color: Colors.white,
                    ))
              ],
              // bottom: const TabBar(
              // labelColor: Colors.white,
              // unselectedLabelColor: Colors.black54,
              // tabs: [
              // Tab(text: 'Progress'),
              // Tab(text: 'Circle'),
              // ],
              // indicatorColor: Colors.white,
              // ),
            ),
            body: Column(children: [
              Stack(
                children: [
                  Container(
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        height: 340,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(children: [
                          Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                'Invoices Summary',
                                style: Theme.of(context).textTheme.titleLarge,
                              )),
                          ListTile(
                            title: const Text('Total Invoices Amount'),
                            trailing: const Text('10'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Paid'),
                            trailing: const Text('20'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Partial Payment'),
                            trailing: const Text('30'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Unpaid'),
                            trailing: const Text('40'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Overdue'),
                            trailing: const Text('50'),
                            onTap: () {},
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          columns: const [
                            DataColumn(label: Text('Invoice #')),
                            DataColumn(label: Text('Customer')),
                            DataColumn(label: Text('Payment status')),
                            DataColumn(label: Text('Title')),
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('Invoice date')),
                            DataColumn(label: Text('Invoice due date')),
                            DataColumn(label: Text('Amount')),
                          ],
                          rows: List<DataRow>.generate(
                            8,
                            (index) {
                              return const DataRow(cells: [
                                DataCell(
                                  Center(
                                    child: Text('Anas'),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text('25'),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text('Developer'),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text('Ali'),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text('25'),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text('Backend'),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text('Mohsin'),
                                  ),
                                ),
                                DataCell(
                                  Center(
                                    child: Text('25'),
                                  ),
                                ),
                              ]);
                            },
                          )),
                    ),
                  ),
                ),
              ),
            ])));
  }
}
