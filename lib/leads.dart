import 'package:flutter/material.dart';
import 'home.dart';

class Leads extends StatefulWidget {
  const Leads({super.key});

  @override
  State<Leads> createState() => _LeadsState();
}

class _LeadsState extends State<Leads> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),
      appBar: AppBar(
        title: const Text('Leads'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: GridView(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
          ),
          children: const [
            GridTileofApp(
                firstText: 'Add', secondText: 'new', iconData: Icons.add),
            GridTileofApp(
                firstText: 'All', secondText: '', iconData: Icons.people),
          ],
        ),
      ),
    );
  }
}
