import 'package:crm_new/home.dart';
import 'package:flutter/material.dart';

class Roles extends StatefulWidget {
  const Roles({super.key});

  @override
  State<Roles> createState() => _RolesState();
}

class _RolesState extends State<Roles> {
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
                'Roles',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addRole');
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
                              image: 'images/contacts.png',
                              firstText: 'Contacts',
                              secondText: ''),
                          GridTileofApp(
                              image: 'images/users.png',
                              firstText: 'Users',
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
                                      DataColumn(label: Text('Title')),
                                      DataColumn(label: Text('Modules')),
                                      DataColumn(label: Text('Actions')),
                                    ],
                                    rows: List<DataRow>.generate(
                                      4,
                                      (index) {
                                        return DataRow(cells: [
                                          const DataCell(
                                            Center(
                                              child: Text('Executive'),
                                            ),
                                          ),
                                          const DataCell(
                                            Center(
                                              child: Text(
                                                  'Users, Permission, Roles'),
                                            ),
                                          ),
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
