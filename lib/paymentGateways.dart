// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PaymentGateways extends StatefulWidget {
  const PaymentGateways({super.key});

  @override
  State<PaymentGateways> createState() => _PaymentGatewaysState();
}

class _PaymentGatewaysState extends State<PaymentGateways> {
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
            'Payment Gateways',
            style: TextStyle(color: Colors.white),
          ),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Navigator.pushNamed(context, '/addPaymentGateway');
          //       },
          //       icon: const Icon(
          //         Icons.add_circle_rounded,
          //         color: Colors.white,
          //       ))
          // ],
          // bottom: const TabBar(
        ),
        body: Column(children: [
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Description')),
                        DataColumn(label: Text('Logo')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: List<DataRow>.generate(
                        7,
                        (index) {
                          return DataRow(cells: [
                            const DataCell(
                              Center(
                                child: Text('Authorize.net'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text('ipospays.tech'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text(''),
                              ),
                            ),
                            DataCell(Center(
                              child: PopupMenuButton(
                                  itemBuilder: (context) => [
                                        PopupMenuItem(
                                            value: 1,
                                            child: const Text('View'),
                                            onTap: () {}),
                                        PopupMenuItem(
                                            value: 2,
                                            child: const Text('Set Default'),
                                            onTap: () {}),
                                      ]),
                            ))
                          ]);
                        },
                      )),
                ),
              ),
            ),
          ),
        ]));
  }
}
