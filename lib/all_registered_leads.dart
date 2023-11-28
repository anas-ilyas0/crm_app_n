import 'package:crm_new/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AllLeads extends StatelessWidget {
  //const AllLeads({super.key});
  String name, email, contactInfo, currency;

  AllLeads({
    super.key,
    this.name = '',
    this.email = '',
    this.contactInfo = '',
    this.currency = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Leads'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Table(
            defaultColumnWidth: const FixedColumnWidth(120.0),
            border: TableBorder.all(
                color: Colors.black, style: BorderStyle.solid, width: 2),
            children: [
              const TableRow(children: [
                Column(
                    children: [Text('Name', style: TextStyle(fontSize: 20.0))]),
                Column(children: [
                  Text('Email', style: TextStyle(fontSize: 20.0))
                ]),
                Column(children: [
                  Text('Contact Type', style: TextStyle(fontSize: 18.0))
                ]),
                Column(children: [
                  Text('Currency', style: TextStyle(fontSize: 20.0))
                ]),
              ]),
              TableRow(children: [
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        children: [Text(context.watch<UserProvider>().name)]),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Text(context.watch<UserProvider>().email),
                  ]),
                ),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Text(context.watch<UserProvider>().contactInfo),
                    ]),
                  ),
                ]),
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Text(context.watch<UserProvider>().currency),
                    ]),
                  ),
                ]),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
