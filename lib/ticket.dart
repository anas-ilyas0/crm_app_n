import 'package:flutter/material.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
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
            'Tickets',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addTicket');
                },
                icon: const Icon(
                  Icons.add_circle_rounded,
                  color: Colors.white,
                ))
          ],
          // bottom: const TabBar(
        ),
        body: Column(children: [
          Stack(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(0)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    height: 225,
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
                            'Tickets Summary',
                            style: Theme.of(context).textTheme.titleLarge,
                          )),
                      ListTile(
                        title: const Text('Total Tickets'),
                        trailing: const Text('10'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Active Tickets'),
                        trailing: const Text('20'),
                        onTap: () {},
                      ),
                      ListTile(
                        title: const Text('Completed Tickets'),
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
                        DataColumn(label: Text('Subject')),
                        DataColumn(label: Text('Status')),
                        DataColumn(label: Text('Last updated')),
                        DataColumn(label: Text('Agent')),
                        DataColumn(label: Text('Priority')),
                        DataColumn(label: Text('Category')),
                        DataColumn(label: Text('Created')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: List<DataRow>.generate(
                        8,
                        (index) {
                          return DataRow(cells: [
                            const DataCell(
                              Center(
                                child: Text('Analog version'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text('Merley Reynolds'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text('Hilma Maggio'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text('10-02-2019'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text('10-16-2023'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text('Medium'),
                              ),
                            ),
                            const DataCell(
                              Center(
                                child: Text('In Progress'),
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
                                          onTap: () {},
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
        ]));
  }
}
