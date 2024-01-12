import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
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
                'Expenses',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/addExpense');
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
                                'Expenses Summary',
                                style: Theme.of(context).textTheme.titleLarge,
                              )),
                          ListTile(
                            title: const Text('Total Expense'),
                            trailing: const Text('\$10'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Total Expense This Month'),
                            trailing: const Text('\$20'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Total Expense This Week'),
                            trailing: const Text('\$30'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Total Expense Last 30 Days'),
                            trailing: const Text('\$40'),
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
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('Account')),
                            DataColumn(label: Text('Expense category')),
                            DataColumn(label: Text('Entry date')),
                            DataColumn(label: Text('Amount')),
                            DataColumn(label: Text('Payee')),
                            DataColumn(label: Text('Pay method')),
                            DataColumn(label: Text('Actions')),
                          ],
                          rows: List<DataRow>.generate(
                            8,
                            (index) {
                              return DataRow(cells: [
                                const DataCell(
                                  Center(
                                    child:
                                        Text('Payment for Purchase Order # 16'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('Bank of America'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('Monthly Expenses'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('02-12-2023'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('\$370'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('Grover Emmerich'),
                                  ),
                                ),
                                const DataCell(
                                  Center(
                                    child: Text('Stripe'),
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
            ])));
  }
}
