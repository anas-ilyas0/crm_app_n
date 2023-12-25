import 'package:flutter/material.dart';

class RecurringInvoices extends StatefulWidget {
  const RecurringInvoices({super.key});

  @override
  State<RecurringInvoices> createState() => _RecurringInvoicesState();
}

class _RecurringInvoicesState extends State<RecurringInvoices> {
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
                'Recurring Invoices',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addRecurringInvoice');
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
                        height: 290,
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
                                'Recurring Invoices Summary',
                                style: Theme.of(context).textTheme.titleLarge,
                              )),
                          ListTile(
                            title:
                                const Text('Total Recurring Invoices Amount'),
                            trailing: const Text('10'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Paid'),
                            trailing: const Text('20'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Unpaid'),
                            trailing: const Text('30'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Overdue'),
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
                            DataColumn(label: Text('Invoice #')),
                            DataColumn(label: Text('Customer')),
                            DataColumn(label: Text('Currency')),
                            DataColumn(label: Text('Title')),
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('Invoice date')),
                            DataColumn(label: Text('Invoice due date')),
                            DataColumn(label: Text('Recurring period')),
                            DataColumn(label: Text('Amount')),
                            DataColumn(label: Text('Payment status')),
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
                                    child: Text('Mohsin'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('25'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('Paid'),
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
                                                Navigator.pushNamed(context,
                                                    '/viewRecurringInvoices');
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
