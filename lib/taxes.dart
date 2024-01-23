import 'package:flutter/material.dart';

class Taxes extends StatefulWidget {
  const Taxes({super.key});

  @override
  State<Taxes> createState() => _TaxesState();
}

class _TaxesState extends State<Taxes> {
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
            'Taxes',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addTax');
                },
                icon: const Icon(
                  Icons.add_circle_rounded,
                  color: Colors.white,
                ))
          ],
          // bottom: const TabBar(
        ),
        body: Center(
          child: Column(children: [
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
                          DataColumn(label: Text('Rate')),
                          DataColumn(label: Text('Rate type')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: List<DataRow>.generate(
                          7,
                          (index) {
                            return DataRow(cells: [
                              const DataCell(
                                Center(
                                  child: Text('USD'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('\$67'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('Value'),
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
                                            onTap: () {},
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
