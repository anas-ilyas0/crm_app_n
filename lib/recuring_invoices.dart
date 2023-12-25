import 'package:crm_new/home.dart';
import 'package:flutter/material.dart';

class RecuringInvoices extends StatefulWidget {
  const RecuringInvoices({super.key});

  @override
  State<RecuringInvoices> createState() => _RecuringInvoicesState();
}

class _RecuringInvoicesState extends State<RecuringInvoices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Recurring Invoices',
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
                    image: 'images/invoice.png',
                    firstText: 'Recurring',
                    secondText: 'Invoices'),
                GridTileofApp(
                    image: 'images/periods.png',
                    firstText: 'Recurring',
                    secondText: 'Periods'),
              ]),
        ),
      ),
    );
  }
}
