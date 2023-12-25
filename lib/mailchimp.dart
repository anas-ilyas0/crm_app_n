import 'package:flutter/material.dart';

class Mailchimp extends StatefulWidget {
  const Mailchimp({super.key});

  @override
  State<Mailchimp> createState() => _MailchimpState();
}

class _MailchimpState extends State<Mailchimp> {
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
                'Mailchimp Lists',
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
                                  DataColumn(label: Text('Name')),
                                  DataColumn(label: Text('Member count')),
                                  DataColumn(label: Text('Is schedule?')),
                                  DataColumn(label: Text('Last run')),
                                ],
                                rows: List<DataRow>.generate(
                                  4,
                                  (index) {
                                    return const DataRow(cells: [
                                      DataCell(
                                        Center(
                                            //child: Text('London Warehouse'),
                                            ),
                                      ),
                                      DataCell(
                                        Center(
                                            //child: Text('London Warehouse'),
                                            ),
                                      ),
                                      DataCell(
                                        Center(
                                            //child: Text('London Warehouse'),
                                            ),
                                      ),
                                      DataCell(Center(
                                          //child: Text('London Warehouse')
                                          ))
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
