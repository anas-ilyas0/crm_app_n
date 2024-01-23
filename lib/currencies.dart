import 'package:flutter/material.dart';

class Currencies extends StatefulWidget {
  const Currencies({super.key});

  @override
  State<Currencies> createState() => _CurrenciesState();
}

class _CurrenciesState extends State<Currencies> {
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
                'Currencies',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addCurrency');
                    },
                    icon: const Icon(
                      Icons.add_circle_rounded,
                      color: Colors.white,
                    ))
              ],
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
                            DataColumn(label: Text('Symbol')),
                            DataColumn(label: Text('Code')),
                            DataColumn(label: Text('Rate')),
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('Is Default?')),
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
                                    child: Text('\$'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('USD'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('1'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('Active'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('Yes'),
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
                                                onTap: () {}),
                                            PopupMenuItem(
                                                value: 3,
                                                child:
                                                    const Text('Make Default'),
                                                onTap: () {}),
                                            PopupMenuItem(
                                                value: 4,
                                                child: const Text('Delete'),
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
            ])));
  }
}
