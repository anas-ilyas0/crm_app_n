import 'package:flutter/material.dart';

class ViewContract extends StatefulWidget {
  const ViewContract({super.key});

  @override
  State<ViewContract> createState() => _ViewContractState();
}

class _ViewContractState extends State<ViewContract> {
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
          'View Contract',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
