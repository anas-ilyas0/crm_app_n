import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _DashboardState();
}

class _DashboardState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRM'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: const Color(0xFFF4F9FD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 1),
            children: const [
              GridTileofApp(
                firstText: 'Dashboard',
                secondText: '',
                iconData: Icons.settings,
              ),
              GridTileofApp(
                firstText: 'Leads',
                secondText: '',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Sales',
                secondText: '',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Recurring',
                secondText: 'Invoices',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Product',
                secondText: 'Management',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Purchase',
                secondText: 'Orders',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Contact',
                secondText: 'Management',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'User',
                secondText: 'Management',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Projects',
                secondText: '',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Accounting',
                secondText: '',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Cart',
                secondText: 'Orders',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Task',
                secondText: 'Management',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Assets',
                secondText: 'Management',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Content',
                secondText: 'Management',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Generated',
                secondText: 'Reports',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Quick',
                secondText: 'Notifications',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Knowledgebase',
                secondText: '',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Global',
                secondText: 'settings',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Plugins',
                secondText: '',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Messages',
                secondText: '',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Todo',
                secondText: '',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Goals',
                secondText: '',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Ticket',
                secondText: '',
                iconData: Icons.abc,
              ),
              GridTileofApp(
                firstText: 'Logout',
                secondText: '',
                iconData: Icons.abc,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GridTileofApp extends StatelessWidget {
  const GridTileofApp({
    Key? key,
    required this.iconData,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  final IconData iconData;
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (firstText == 'Dashboard') {
          Navigator.pushNamed(context, '/dashboard');
        }
        if (firstText == 'Leads') {
          Navigator.pushNamed(context, '/leads');
        }
        if (firstText == 'Sales') {
          Navigator.pushNamed(context, '/sales');
        }
        if (firstText == 'Recurring') {
          Navigator.pushNamed(context, '/recurring');
        }
        if (firstText == 'Product') {
          Navigator.pushNamed(context, '/product');
        }
        if (firstText == 'Purchase') {
          Navigator.pushNamed(context, '/purchase');
        }
        if (firstText == 'Contact') {
          Navigator.pushNamed(context, '/contact');
        }
        if (firstText == 'User') {
          Navigator.pushNamed(context, '/user');
        }
        if (firstText == 'Projects') {
          Navigator.pushNamed(context, '/projects');
        }
        if (firstText == 'Accounting') {
          Navigator.pushNamed(context, '/accounting');
        }
        if (firstText == 'Cart') {
          Navigator.pushNamed(context, '/cart');
        }
        if (firstText == 'Task') {
          Navigator.pushNamed(context, '/task');
        }
        if (firstText == 'Assets') {
          Navigator.pushNamed(context, '/assets');
        }
        if (firstText == 'Content') {
          Navigator.pushNamed(context, '/content');
        }
        if (firstText == 'Generated') {
          Navigator.pushNamed(context, '/generated');
        }
        if (firstText == 'Quick') {
          Navigator.pushNamed(context, '/quick');
        }
        if (firstText == 'Knowlwdgebase') {
          Navigator.pushNamed(context, '/knowledgebase');
        }
        if (firstText == 'Global') {
          Navigator.pushNamed(context, '/global');
        }
        if (firstText == 'Plugins') {
          Navigator.pushNamed(context, '/plugins');
        }
        if (firstText == 'Messages') {
          Navigator.pushNamed(context, '/messages');
        }
        if (firstText == 'Todo') {
          Navigator.pushNamed(context, '/todo');
        }
        if (firstText == 'Goals') {
          Navigator.pushNamed(context, '/goals');
        }
        if (firstText == 'Ticket') {
          Navigator.pushNamed(context, '/ticket');
        }
        if (firstText == 'Logout') {
          Navigator.pushNamed(context, '/logout');
        }
        if (firstText == 'Add') {
          Navigator.pushNamed(context, '/create');
        }
        if (firstText == 'All') {
          Navigator.pushNamed(context, '/allLeads');
        }
      },
      child: Column(
        children: [
          Icon(iconData),
          const SizedBox(height: 10),
          Text(firstText),
          Text(secondText),
        ],
      ),
    );
  }
}
