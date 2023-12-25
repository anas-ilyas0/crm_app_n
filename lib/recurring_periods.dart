import 'package:flutter/material.dart';

class RecurringPeriods extends StatefulWidget {
  const RecurringPeriods({super.key});

  @override
  State<RecurringPeriods> createState() => _RecurringPeriodsState();
}

class _RecurringPeriodsState extends State<RecurringPeriods> {
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
                'Recurring Periods',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addRecurringPeriod');
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
                                DataColumn(label: Text('Value')),
                                DataColumn(label: Text('Actions')),
                              ],
                              rows: List<DataRow>.generate(
                                5,
                                (index) {
                                  return DataRow(cells: [
                                    const DataCell(
                                      Center(
                                        child: Text('Day'),
                                      ),
                                    ),
                                    const DataCell(
                                      Center(
                                        child: Text('1 Week'),
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
                                                  onTap: () {
                                                    Navigator.pushNamed(context,
                                                        '/viewRecurringPeriod');
                                                  },
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
