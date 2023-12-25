import 'package:crm_new/home.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
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
                'Users',
                style: TextStyle(color: Colors.white),
              ),
              // bottom: const TabBar(
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GridView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 1.9),
                        children: const [
                          GridTileofApp(
                              image: 'images/roles.png',
                              firstText: 'Roles',
                              secondText: ''),
                          GridTileofApp(
                              image: 'images/departments.png',
                              firstText: 'Departments',
                              secondText: '')
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: DataTable(
                                    columns: const [
                                      DataColumn(label: Text('Name')),
                                      DataColumn(label: Text('Email')),
                                      DataColumn(label: Text('Role')),
                                      DataColumn(label: Text('Status')),
                                      DataColumn(label: Text('Actions')),
                                    ],
                                    rows: List<DataRow>.generate(
                                      4,
                                      (index) {
                                        return DataRow(cells: [
                                          const DataCell(
                                            Center(
                                              child: Text('Ronak'),
                                            ),
                                          ),
                                          const DataCell(
                                            Center(
                                              child: Text('ronak@gmail.com'),
                                            ),
                                          ),
                                          const DataCell(
                                            Center(
                                              child: Text('Admin'),
                                            ),
                                          ),
                                          const DataCell(
                                              Center(child: Text('Active'))),
                                          DataCell(Center(
                                            child: PopupMenuButton(
                                                itemBuilder: (context) => [
                                                      PopupMenuItem(
                                                          value: 1,
                                                          child: const Text(
                                                              'Edit'),
                                                          onTap: () {}),
                                                      PopupMenuItem(
                                                        value: 2,
                                                        child:
                                                            const Text('View'),
                                                        onTap: () {},
                                                      ),
                                                      PopupMenuItem(
                                                        value: 3,
                                                        child: const Text(
                                                            'Suspend'),
                                                        onTap: () {},
                                                      ),
                                                      PopupMenuItem(
                                                        value: 4,
                                                        child: const Text(
                                                            'Delete'),
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
                      ),
                    ]),
              ),
            )));
  }
}
