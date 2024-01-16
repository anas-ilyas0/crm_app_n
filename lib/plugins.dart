import 'package:flutter/material.dart';

class Plugins extends StatefulWidget {
  const Plugins({super.key});

  @override
  State<Plugins> createState() => _PluginsState();
}

class _PluginsState extends State<Plugins> {
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
            'Plugins',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addPlugin');
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
                        DataColumn(label: Text('Slug')),
                        DataColumn(label: Text('Type')),
                        DataColumn(label: Text('Enabled')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: List<DataRow>.generate(
                        7,
                        (index) {
                          return DataRow(cells: [
                            const DataCell(
                              Center(
                                child: Text('Invoices'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text('Invoice'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text('Core'),
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
                                            child: const Text('View'),
                                            onTap: () {}),
                                        PopupMenuItem(
                                          value: 2,
                                          child: const Text('Active'),
                                          onTap: () {},
                                        ),
                                        // PopupMenuItem(
                                        //   value: 3,
                                        //   child: const Text('Delete'),
                                        //   onTap: () {},
                                        // )
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
