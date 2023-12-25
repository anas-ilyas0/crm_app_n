import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
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
              'Contacts',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addContact');
                  },
                  icon: const Icon(
                    Icons.add_circle_rounded,
                    color: Colors.white,
                  ))
            ]),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Contact type')),
                          DataColumn(label: Text('Email')),
                          DataColumn(label: Text('Address')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: List<DataRow>.generate(
                          8,
                          (index) {
                            return DataRow(cells: [
                              const DataCell(
                                Center(
                                  child: Text('Rahul'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('Employee'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('rahul@gmail.com'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text(
                                      'Srinagar colony 1st lane, Ongole, AP - 523002'),
                                ),
                              ),
                              DataCell(Center(
                                child: PopupMenuButton(
                                    itemBuilder: (context) => [
                                          PopupMenuItem(
                                              value: 1,
                                              child: const Text('View'),
                                              onTap: () {}),
                                          PopupMenuItem(
                                            value: 2,
                                            child: const Text('Edit'),
                                            onTap: () {},
                                          ),
                                          PopupMenuItem(
                                            value: 2,
                                            child: const Text('Edit user'),
                                            onTap: () {},
                                          ),
                                          PopupMenuItem(
                                            value: 2,
                                            child: const Text('Send email'),
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
          ]),
        ));
  }
}
