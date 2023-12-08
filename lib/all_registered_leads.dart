import 'package:crm_new/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AllLeads extends StatelessWidget {
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
    var dataProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
        ),
        title: const Text(
          'All Leads',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/create');
              },
              icon: const Icon(
                Icons.add_circle_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Builder(builder: (BuildContext context) {
            if (dataProvider.dataAvailable) {
              return ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 1,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (BuildContext context, index) {
                    return ListTile(
                        leading: Container(
                          height: 100,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                  image: AssetImage('images/emily.png'),
                                  fit: BoxFit.cover)),
                        ),
                        title: Text('Name : \n${dataProvider.name}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email :${dataProvider.email}'),
                            Text('Address : ${dataProvider.address}'),
                            Text('Contact Type : ${dataProvider.contactType}'),
                          ],
                        ),
                        trailing: PopupMenuButton(
                            itemBuilder: (context) => const [
                                  PopupMenuItem(
                                      value: 1, child: Text('Create Proposal')),
                                  PopupMenuItem(
                                      value: 2, child: Text('Send Email')),
                                  PopupMenuItem(value: 3, child: Text('Edit')),
                                  PopupMenuItem(value: 4, child: Text('View')),
                                  PopupMenuItem(value: 5, child: Text('Delete'))
                                ]));
                  });
            } else {
              return const Center(
                child: Text('No data available.'),
              );
            }
          })
          // Table(
          // defaultColumnWidth: const FixedColumnWidth(120.0),
          // border: TableBorder.all(
          // color: Colors.black, style: BorderStyle.solid, width: 2),
          // children: [
          // const TableRow(children: [
          // Column(
          // children: [Text('Name', style: TextStyle(fontSize: 20.0))]),
          // Column(children: [
          // Text('Email', style: TextStyle(fontSize: 20.0))
          // ]),
          // Column(children: [
          // Text('Contact Type', style: TextStyle(fontSize: 18.0))
          // ]),
          // Column(children: [
          // Text('Currency', style: TextStyle(fontSize: 20.0))
          // ]),
          // ]),
          // TableRow(children: [
          // Column(children: [
          // Padding(
          // padding: const EdgeInsets.all(8.0),
          // child: Column(
          // children: [Text(context.watch<UserProvider>().name)]),
          // ),
          // ]),
          // Padding(
          // padding: const EdgeInsets.all(8.0),
          // child: Column(children: [
          // Text(context.watch<UserProvider>().email),
          // ]),
          // ),
          // Column(children: [
          // Padding(
          // padding: const EdgeInsets.all(8.0),
          // child: Column(children: [
          // Text(context.watch<UserProvider>().contactInfo),
          // ]),
          // ),
          // ]),
          // Column(children: [
          // Padding(
          // padding: const EdgeInsets.all(8.0),
          // child: Column(children: [
          // Text(context.watch<UserProvider>().currency),
          // ]),
          // ),
          // ]),
          // ]),
          // ],
          // ),
          ),
    );
  }
}
