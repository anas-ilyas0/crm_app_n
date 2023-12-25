import 'package:flutter/material.dart';

class ViewRecurringInvoice extends StatefulWidget {
  const ViewRecurringInvoice({super.key});

  @override
  State<ViewRecurringInvoice> createState() => _ViewRecurringInvoiceState();
}

class _ViewRecurringInvoiceState extends State<ViewRecurringInvoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'View Recurring Invoice',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
