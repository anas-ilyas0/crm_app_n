import 'package:flutter/material.dart';

class Brands extends StatefulWidget {
  const Brands({super.key});

  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
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
            'Brands',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addBrand');
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
                            DataColumn(label: Text('Icon')),
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('Actions')),
                          ],
                          rows: List<DataRow>.generate(
                            5,
                            (index) {
                              return DataRow(cells: [
                                const DataCell(
                                  Center(
                                    child: Text('MRF'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('Icon'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('Active'),
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
                                                onTap: () {}),
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
        ));
  }
}
