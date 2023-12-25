// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ViewRecurringPeriod extends StatefulWidget {
  const ViewRecurringPeriod({super.key});

  @override
  State<ViewRecurringPeriod> createState() => _ViewRecurringPeriodState();
}

class _ViewRecurringPeriodState extends State<ViewRecurringPeriod> {
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
                'View Recurring Period',
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
                          child: DataTable(
                              columns: const [
                                DataColumn(label: Text('Title')),
                                DataColumn(label: Text('Value')),
                                DataColumn(label: Text('Description')),
                              ],
                              rows: List<DataRow>.generate(
                                5,
                                (index) {
                                  return const DataRow(cells: [
                                    DataCell(
                                      Center(
                                        child: Text('Day'),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text('1 Week'),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text('DS'),
                                      ),
                                    ),
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
