import 'package:crm_new/ui/screens/new_lead/tabs/ach.dart';
import 'package:crm_new/ui/screens/new_lead/tabs/business_info.dart';
import 'package:crm_new/ui/screens/new_lead/tabs/equipments.dart';
import 'package:crm_new/ui/screens/new_lead/tabs/owner_info.dart';
import 'package:crm_new/ui/screens/new_lead/tabs/price.dart';
import 'package:flutter/material.dart';

class NewLead extends StatefulWidget {
  const NewLead({Key? key}) : super(key: key);

  @override
  State<NewLead> createState() => _NewLeadState();
}

class _NewLeadState extends State<NewLead> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            backgroundColor: Colors.blue,
            title: Text(
              'New Lead',
              style: TextStyle(color: Colors.white),
            ),
            bottom: TabBar(
                tabAlignment: TabAlignment.start,
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Text(
                      'Business Info',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Owner Info',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Price',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'ACH',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Equipments',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            BusinessInfo(),
            OwnerInfo(),
            Price(),
            ACH(),
            Equipments(),
          ]),
        ),
      ),
    );
  }
}
