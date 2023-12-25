import 'package:flutter/material.dart';

class CreditNotes extends StatefulWidget {
  const CreditNotes({super.key});

  @override
  State<CreditNotes> createState() => _CreditNotesState();
}

class _CreditNotesState extends State<CreditNotes> {
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
                'Credit Notes',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addCredit');
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
                    height: 110,
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
                        height: 230,
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
                                'Credit Notes Summary',
                                style: Theme.of(context).textTheme.titleLarge,
                              )),
                          ListTile(
                            title: const Text('Total Credit Notes Amount'),
                            trailing: const Text('10'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Closed'),
                            trailing: const Text('20'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Open'),
                            trailing: const Text('30'),
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
                            DataColumn(label: Text('Credit #')),
                            DataColumn(label: Text('Credit note date')),
                            DataColumn(label: Text('Customer')),
                            DataColumn(label: Text('Credit status')),
                            DataColumn(label: Text('Reference')),
                            DataColumn(label: Text('Amount')),
                            DataColumn(label: Text('Actions')),
                          ],
                          rows: List<DataRow>.generate(
                            7,
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
                                                    context, '/viewCredit');
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
