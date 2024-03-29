import 'package:flutter/material.dart';

class QuickNotifications extends StatefulWidget {
  const QuickNotifications({super.key});

  @override
  State<QuickNotifications> createState() => _QuickNotificationsState();
}

class _QuickNotificationsState extends State<QuickNotifications> {
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
              'Quick Notifications',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addQuickNotification');
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
                          DataColumn(label: Text('Text')),
                          DataColumn(label: Text('Link')),
                          DataColumn(label: Text('Users')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: List<DataRow>.generate(
                          8,
                          (index) {
                            return DataRow(cells: [
                              const DataCell(
                                Center(
                                  child: Text('Client Accepted'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('http://phpstack.com'),
                                ),
                              ),
                              const DataCell(
                                Center(
                                  child: Text('Admin'),
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
