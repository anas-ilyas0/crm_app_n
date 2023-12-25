import 'package:flutter/material.dart';

class Warehouses extends StatefulWidget {
  const Warehouses({super.key});

  @override
  State<Warehouses> createState() => _WarehousesState();
}

class _WarehousesState extends State<Warehouses> {
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
                'Warehouses',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addWarehouse');
                    },
                    icon: const Icon(
                      Icons.add_circle_rounded,
                      color: Colors.white,
                    ))
              ],
              // bottom: const TabBar(
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              columns: const [
                                DataColumn(label: Text('Name')),
                                DataColumn(label: Text('Actions')),
                              ],
                              rows: List<DataRow>.generate(
                                5,
                                (index) {
                                  return DataRow(cells: [
                                    const DataCell(
                                      Center(
                                        child: Text('London Warehouse'),
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
              ),
            )));
  }
}
