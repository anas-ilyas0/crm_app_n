// ignore_for_file: file_names

import 'package:flutter/material.dart';

class EmailTemplates extends StatefulWidget {
  const EmailTemplates({super.key});

  @override
  State<EmailTemplates> createState() => _EmailTemplatesState();
}

class _EmailTemplatesState extends State<EmailTemplates> {
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
            'Email Templates',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addEmailTemplate');
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
                        DataColumn(label: Text('Type')),
                        DataColumn(label: Text('Subject')),
                        DataColumn(label: Text('From Email')),
                        DataColumn(label: Text('From Name')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: List<DataRow>.generate(
                        7,
                        (index) {
                          return DataRow(cells: [
                            const DataCell(
                              Center(
                                child: Text('contract-created'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text('content'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text('Contract Created'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text('admin@blockspos.com'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text('BlockPOS'),
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
                                            child: const Text('Duplicate'),
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
        ]));
  }
}
