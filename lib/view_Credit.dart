// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ViewCredit extends StatefulWidget {
  const ViewCredit({super.key});

  @override
  State<ViewCredit> createState() => _ViewCreditState();
}

class _ViewCreditState extends State<ViewCredit> {
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
          'View Credit Note',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
