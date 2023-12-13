import 'package:crm_new/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AllLeads extends StatelessWidget {
  const AllLeads({
    super.key,
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
            Navigator.pushReplacementNamed(context, '/home');
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
                        leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            backgroundImage: dataProvider.image != null
                                ? FileImage(dataProvider.image!)
                                : null),
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
                            itemBuilder: (context) => [
                                  const PopupMenuItem(
                                      value: 1, child: Text('Create Proposal')),
                                  const PopupMenuItem(
                                      value: 2, child: Text('Send Email')),
                                  PopupMenuItem(
                                      value: 3,
                                      child: const Text('Edit'),
                                      onTap: () {
                                        Navigator.pushNamed(context, '/create');
                                      }),
                                  PopupMenuItem(
                                    value: 4,
                                    child: const Text('View'),
                                    onTap: () {
                                      Navigator.pushNamed(context, '/view');
                                    },
                                  ),
                                  const PopupMenuItem(
                                      value: 5, child: Text('Delete'))
                                ]));
                  });
            } else {
              return const Center(
                child: Text('No data available.'),
              );
            }
          })),
    );
  }
}
