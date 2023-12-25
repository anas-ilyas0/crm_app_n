import 'package:crm_new/home.dart';
import 'package:flutter/material.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
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
                    image: 'images/invoice.png',
                    firstText: 'Invoices',
                    secondText: ''),
                GridTileofApp(
                    image: 'images/creditNotes.png',
                    firstText: 'Credit',
                    secondText: 'Notes'),
                GridTileofApp(
                    image: 'images/quotes.png',
                    firstText: 'Quotes',
                    secondText: ''),
                GridTileofApp(
                    image: 'images/proposal.png',
                    firstText: 'Proposals',
                    secondText: ''),
                GridTileofApp(
                    image: 'images/contract.png',
                    firstText: 'Contracts',
                    secondText: ''),
              ]),
        ),
      ),
    );
  }
}
