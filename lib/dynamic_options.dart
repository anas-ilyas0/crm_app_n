import 'package:flutter/material.dart';

class DynamicOptions extends StatefulWidget {
  const DynamicOptions({super.key});

  @override
  State<DynamicOptions> createState() => _DynamicOptionsState();
}

class _DynamicOptionsState extends State<DynamicOptions> {
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
                'Dynamic Options',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addDynamicOption');
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
                            DataColumn(label: Text('Module')),
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
