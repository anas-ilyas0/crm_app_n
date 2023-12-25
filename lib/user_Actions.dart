// ignore_for_file: file_names

import 'package:flutter/material.dart';

class UserActions extends StatefulWidget {
  const UserActions({super.key});

  @override
  State<UserActions> createState() => _UserActionsState();
}

class _UserActionsState extends State<UserActions> {
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
                'User Actions',
                style: TextStyle(color: Colors.white),
              ),
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
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DataTable(
                                columns: const [
                                  DataColumn(label: Text('Time')),
                                  DataColumn(label: Text('User')),
                                  DataColumn(label: Text('Action')),
                                  DataColumn(label: Text('Action model')),
                                  DataColumn(label: Text('Action ID')),
                                ],
                                rows: List<DataRow>.generate(
                                  4,
                                  (index) {
                                    return const DataRow(cells: [
                                      DataCell(
                                        Center(
                                          child: Text('12-24-2023 12:00 PM'),
                                        ),
                                      ),
                                      DataCell(
                                        Center(
                                          child: Text('Ali'),
                                        ),
                                      ),
                                      DataCell(
                                        Center(
                                          child: Text('Created '),
                                        ),
                                      ),
                                      DataCell(Center(
                                          child: Text('Invoices history'))),
                                      DataCell(Center(child: Text('6761')))
                                    ]);
                                  },
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            )));
  }
}
