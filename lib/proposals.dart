// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Proposals extends StatefulWidget {
  const Proposals({super.key});

  @override
  State<Proposals> createState() => _ProposalsState();
}

class _ProposalsState extends State<Proposals> {
  // final List<Map<String, String>> data = [
  // {'Name': 'John', 'Age': '25', 'Role': 'Developer'},
  // {'Name': 'Alice', 'Age': '30', 'Role': 'Designer'},
  // {'Name': 'Bob', 'Age': '28', 'Role': 'Manager'},
  // ];

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
                'Proposals',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addProposal');
                    },
                    icon: const Icon(
                      Icons.add_circle_rounded,
                      color: Colors.white,
                    ))
              ],
              // bottom: const TabBar(
              // labelColor: Colors.white,
              // unselectedLabelColor: Colors.black54,
              // tabs: [
              // Tab(text: 'Progress'),
              // Tab(text: 'Circle'),
              // ],
              // indicatorColor: Colors.white,
              // ),
            ),
            body: Column(children: [
              Stack(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        height: 280,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(children: [
                          Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                'Proposals Summary',
                                style: Theme.of(context).textTheme.titleLarge,
                              )),
                          ListTile(
                            title: const Text('Total Proposals'),
                            trailing: const Text('10'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Total Accepted'),
                            trailing: const Text('20'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Total Delivered'),
                            trailing: const Text('30'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Total Rejected'),
                            trailing: const Text('40'),
                            onTap: () {},
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          columns: const [
                            DataColumn(label: Text('Proposal #')),
                            DataColumn(label: Text('Title')),
                            DataColumn(label: Text('Customer')),
                            DataColumn(label: Text('Amount')),
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('Publish status')),
                            DataColumn(label: Text('Proposal date')),
                            DataColumn(label: Text('Proposal expiry date')),
                            DataColumn(label: Text('Actions')),
                          ],
                          rows: List<DataRow>.generate(
                            8,
                            (index) {
                              return DataRow(cells: [
                                const DataCell(
                                  Center(
                                    child: Text('Anas'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('25'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('Developer'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('Ali'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('25'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('Backend'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('Mohsin'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('25'),
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
                                                Navigator.pushNamed(
                                                    context, '/viewProposal');
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
            ])));
  }
}
