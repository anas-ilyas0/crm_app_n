import 'package:flutter/material.dart';

class DashboardWidgets extends StatefulWidget {
  const DashboardWidgets({super.key});

  @override
  State<DashboardWidgets> createState() => _DashboardWidgetsState();
}

class _DashboardWidgetsState extends State<DashboardWidgets> {
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
                'Dashboard Widgets',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addDashboardWidget');
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
                            DataColumn(label: Text('Title')),
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('Role')),
                            DataColumn(label: Text('Type')),
                            DataColumn(label: Text('Actions')),
                          ],
                          rows: List<DataRow>.generate(
                            7,
                            (index) {
                              return DataRow(cells: [
                                const DataCell(
                                  Center(
                                    child: Text('Inventory'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('Inventor-Content'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('Inventor-Content'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('Inventor-Content'),
                                  ),
                                ),
                                DataCell(Center(
                                  child: PopupMenuButton(
                                      itemBuilder: (context) => [
                                            PopupMenuItem(
                                                value: 1,
                                                child: const Text('Edit'),
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
