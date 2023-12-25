import 'package:crm_new/home.dart';
import 'package:flutter/material.dart';

class Accounting extends StatefulWidget {
  const Accounting({super.key});

  @override
  State<Accounting> createState() => _AccountingState();
}

class _AccountingState extends State<Accounting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Sales',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.4),
              children: const [
                GridTileofApp(
                    image: 'images/incomes.png',
                    firstText: 'Incomes',
                    secondText: ''),
                GridTileofApp(
                    image: 'images/expenses.png',
                    firstText: 'Expenses',
                    secondText: ''),
                GridTileofApp(
                    image: 'images/monthlyReport.png',
                    firstText: 'Monthly',
                    secondText: 'Reports'),
                GridTileofApp(
                    image: 'images/transfers.png',
                    firstText: 'Transfers',
                    secondText: ''),
                GridTileofApp(
                    image: 'images/accounts.png',
                    firstText: 'Accounts',
                    secondText: ''),
              ]),
        ),
      ),
    );
  }
}
