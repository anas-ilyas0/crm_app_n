// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MeasurementUnits extends StatefulWidget {
  const MeasurementUnits({super.key});

  @override
  State<MeasurementUnits> createState() => _MeasurementUnitsState();
}

class _MeasurementUnitsState extends State<MeasurementUnits> {
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
                'Measurement Units',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addMeasurementUnit');
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
                                DataColumn(label: Text('Title')),
                                DataColumn(label: Text('Status')),
                                DataColumn(label: Text('Description')),
                                DataColumn(label: Text('Actions')),
                              ],
                              rows: List<DataRow>.generate(
                                5,
                                (index) {
                                  return DataRow(cells: [
                                    const DataCell(
                                      Center(
                                        child: Text('MRF'),
                                      ),
                                    ),
                                    const DataCell(
                                      Center(
                                        child: Text('Active'),
                                      ),
                                    ),
                                    const DataCell(
                                      Center(
                                        child: Text('CRM'),
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
