import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 30,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white70),
                child: const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(Icons.home),
                      SizedBox(width: 10),
                      Text('Dashboard')
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.people, color: Colors.blue),
                      title: Text('Users'),
                      trailing: Text('5'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.vertical_distribute,
                        color: Colors.amber,
                      ),
                      title: Text('Expense Amount'),
                      trailing: Text('0.00'),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.production_quantity_limits,
                        color: Colors.cyan,
                      ),
                      title: Text('Products'),
                      trailing: Text('12'),
                    ),
                    ListTile(
                      leading: Icon(
                        FontAwesomeIcons.dollarSign,
                        color: Colors.lightGreen,
                      ),
                      title: Text('Income Amount'),
                      trailing: Text('1279.80'),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
