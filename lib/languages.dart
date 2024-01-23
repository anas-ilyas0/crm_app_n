// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
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
            'Languages',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addLanguage');
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
                        DataColumn(label: Text('Language')),
                        DataColumn(label: Text('Code')),
                        DataColumn(label: Text('Is rtl')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: List<DataRow>.generate(
                        7,
                        (index) {
                          return DataRow(cells: [
                            const DataCell(
                              Center(
                                child: Text('Hindi'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text('hi'),
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
                                            value: 2,
                                            child: const Text('Make default'),
                                            onTap: () {}),
                                        PopupMenuItem(
                                            value: 2,
                                            child: const Text('RTL'),
                                            onTap: () {}),
                                        PopupMenuItem(
                                            value: 2,
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
        ]));
  }
}
