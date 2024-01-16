import 'package:flutter/material.dart';

class AllGoals extends StatefulWidget {
  const AllGoals({super.key});

  @override
  State<AllGoals> createState() => _AllGoalsState();
}

class _AllGoalsState extends State<AllGoals> {
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
            'All Goals',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addGoal');
                },
                icon: const Icon(
                  Icons.add_circle_rounded,
                  color: Colors.white,
                ))
          ],
          // bottom: const TabBar(
        ),
        body: Center(
          child: Column(children: [
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Subject #')),
                          DataColumn(label: Text('Personal Goal')),
                          DataColumn(label: Text('Company Goal')),
                          DataColumn(label: Text('Staff Member')),
                          DataColumn(label: Text('Other Goal')),
                          DataColumn(label: Text('Achievements')),
                          DataColumn(label: Text('Start Date')),
                          DataColumn(label: Text('End Date')),
                          DataColumn(label: Text('Goals Types')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: List<DataRow>.generate(
                          7,
                          (index) {
                            return DataRow(cells: [
                              const DataCell(
                                Center(
                                  child: Text('Invoices'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('Invoice'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('Core'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('Yes'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('No'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('No'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('Never'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('Nothing'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('Indicate'),
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
                                            child: const Text('Delete'),
                                            onTap: () {},
                                          ),
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
        ));
  }
}
