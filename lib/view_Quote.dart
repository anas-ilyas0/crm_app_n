// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ViewQuote extends StatefulWidget {
  const ViewQuote({super.key});

  @override
  State<ViewQuote> createState() => _ViewQuoteState();
}

class _ViewQuoteState extends State<ViewQuote> {
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
          'View Quote',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
