// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MasterSettings extends StatefulWidget {
  const MasterSettings({super.key});

  @override
  State<MasterSettings> createState() => _MasterSettingsState();
}

class _MasterSettingsState extends State<MasterSettings> {
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
            'Master Settings',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addMasterSetting');
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
                        DataColumn(label: Text('Key')),
                        DataColumn(label: Text('Module')),
                        DataColumn(label: Text('Module type')),
                        DataColumn(label: Text('Description')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: List<DataRow>.generate(
                        7,
                        (index) {
                          return DataRow(cells: [
                            const DataCell(
                              Center(
                                child: Text('microsoft'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text('Microsoft'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text('General'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text('Microsoft API`s'),
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
                                            value: 2,
                                            child: const Text('Settings'),
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
