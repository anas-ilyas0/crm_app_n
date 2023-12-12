import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  //const Home({Key? key}) : super(key: key);
  final String username;
  const Home({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      // centerTitle: true,
      // elevation: 3,
      // shadowColor: Colors.black,
      // leading: const CircleAvatar(
      // backgroundImage: AssetImage('images/login.png'), radius: 2),
      // leadingWidth: 40,
      // backgroundColor: Colors.white,
      // title: Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // children: [
      // Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // children: [
      // Text(username),
      // ],
      // )
      // ],
      // ),
      // actions: [
      // IconButton(
      // onPressed: () {
      // Navigator.pop(context);
      // },
      // icon: const Icon(Icons.logout, color: Colors.blue))
      // ],
      // ),
      backgroundColor: const Color(0xFFF4F9FD),
      body: SingleChildScrollView(
          child: Column(children: [
        Card(
          shape: Border.all(style: BorderStyle.none),
          color: const Color(0xFFF4F9FD),
          margin: const EdgeInsets.all(0),
          elevation: 3,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('images/emily.png'),
            ),
            title: Text(username,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            subtitle: Text(username,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold)),
            trailing: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.blue,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 1),
            children: const [
              GridTileofApp(
                  firstText: 'Dashboard',
                  secondText: '',
                  image: 'images/dashboard.png'),
              GridTileofApp(
                  firstText: 'Leads', secondText: '', image: 'images/lead.png'),
              GridTileofApp(
                  firstText: 'Sales',
                  secondText: '',
                  image: 'images/sales.png'),
              GridTileofApp(
                  firstText: 'Recurring',
                  secondText: 'Invoices',
                  image: 'images/invoice.png'),
              GridTileofApp(
                  firstText: 'Product',
                  secondText: 'Management',
                  image: 'images/product.png'),
              GridTileofApp(
                  firstText: 'Purchase',
                  secondText: 'Orders',
                  image: 'images/purchase.png'),
              GridTileofApp(
                  firstText: 'Contacts',
                  secondText: 'Management',
                  image: 'images/contact.png'),
              GridTileofApp(
                  firstText: 'User',
                  secondText: 'Management',
                  image: 'images/user.png'),
              GridTileofApp(
                  firstText: 'Projects',
                  secondText: '',
                  image: 'images/project.png'),
              GridTileofApp(
                  firstText: 'Accounting',
                  secondText: '',
                  image: 'images/accounting.png'),
              GridTileofApp(
                  firstText: 'Cart',
                  secondText: 'Orders',
                  image: 'images/cart.png'),
              GridTileofApp(
                  firstText: 'Task',
                  secondText: 'Management',
                  image: 'images/task.png'),
              GridTileofApp(
                  firstText: 'Assets',
                  secondText: 'Management',
                  image: 'images/asset.png'),
              GridTileofApp(
                  firstText: 'Content',
                  secondText: 'Management',
                  image: 'images/content.png'),
              GridTileofApp(
                  firstText: 'Generated',
                  secondText: 'Reports',
                  image: 'images/report.png'),
              GridTileofApp(
                  firstText: 'Quick',
                  secondText: 'Notifications',
                  image: 'images/notification.png'),
              GridTileofApp(
                  firstText: 'Knowledgebase',
                  secondText: '',
                  image: 'images/knowledge.png'),
              GridTileofApp(
                  firstText: 'Global',
                  secondText: 'settings',
                  image: 'images/setting.png'),
              GridTileofApp(
                  firstText: 'Plugins',
                  secondText: '',
                  image: 'images/plugin.png'),
              GridTileofApp(
                  firstText: 'Messages',
                  secondText: '',
                  image: 'images/message.png'),
              GridTileofApp(
                  firstText: 'Todo', secondText: '', image: 'images/todo.png'),
              GridTileofApp(
                  firstText: 'Goals', secondText: '', image: 'images/goal.png'),
              GridTileofApp(
                  firstText: 'Ticket',
                  secondText: '',
                  image: 'images/ticket.png'),
              GridTileofApp(
                  firstText: 'Logout',
                  secondText: '',
                  image: 'images/logout.png'),
            ],
          ),
        ),
      ])),
    ));
  }
}

class GridTileofApp extends StatelessWidget {
  const GridTileofApp({
    Key? key,
    required this.image,
    required this.firstText,
    required this.secondText,
  }) : super(key: key);

  final String image;
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
          Navigator.pushNamed(context, '/allLeads');
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
        if (firstText == 'Contacts') {
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
        if (firstText == 'Details') {
          Navigator.pushNamed(context, '/details');
        }
        if (secondText == 'Notes') {
          Navigator.pushNamed(context, '/contactNotes');
        }
        if (secondText == 'Documents') {
          Navigator.pushNamed(context, '/contactDoc');
        }
        if (firstText == 'Proposals') {
          Navigator.pushNamed(context, '/proposals');
        }
      },
      child: Column(
        children: [
          Image(
            image: AssetImage(image),
            width: 45,
            height: 45,
          ),
          const SizedBox(height: 10),
          Text(firstText, style: const TextStyle(fontSize: 12)),
          Text(secondText, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
