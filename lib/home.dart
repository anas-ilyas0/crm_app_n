import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String username;
  const Home({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                  Navigator.pop(context);
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
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
                  firstText: 'New',
                  secondText: 'Lead',
                  image: 'images/lead.png'),
              GridTileofApp(
                  firstText: 'Sales',
                  secondText: '',
                  image: 'images/sales.png'),
              GridTileofApp(
                  firstText: 'Recuring',
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
                  firstText: 'Users',
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
                  firstText: 'Tasks', secondText: '', image: 'images/task.png'),
              GridTileofApp(
                  firstText: 'Assets',
                  secondText: '',
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
              // GridTileofApp(
              //     firstText: 'Offline',
              //     secondText: 'Data',
              //     image: 'images/emily.png'),
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
    final data = ModalRoute.of(context)?.settings.arguments;
    //as Data; // Ensure correct type casting

    return GestureDetector(
      onTap: () {
        if (firstText == 'Dashboard' && secondText == '') {
          Navigator.pushNamed(context, '/dashboard');
        }
        if (firstText == 'Leads') {
          Navigator.pushNamed(context, '/allLeads');
        }
        if (firstText == 'New' && secondText == 'Lead') {
          Navigator.pushNamed(context, '/newLead');
        }
        if (firstText == 'Sales') {
          Navigator.pushNamed(context, '/sales');
        }
        if (firstText == 'Recuring') {
          Navigator.pushNamed(context, '/recuring');
        }
        if (firstText == 'Recurring' && secondText == 'Invoices') {
          Navigator.pushNamed(context, '/recurringInvoices');
        }
        if (firstText == 'Recurring' && secondText == 'Periods') {
          Navigator.pushNamed(context, '/recurringPeriods');
        }
        if (firstText == 'Product') {
          Navigator.pushNamed(context, '/product');
        }
        if (firstText == 'Business') {
          Navigator.pushNamed(context, '/businessList');
        }
        if (firstText == 'All' && secondText == 'Products') {
          Navigator.pushNamed(context, '/products');
        }
        if (firstText == 'Products' && secondText == 'Transfer') {
          Navigator.pushNamed(context, '/productsTransfer');
        }
        if (firstText == 'Brands') {
          Navigator.pushNamed(context, '/brands');
        }
        if (firstText == 'Measurement') {
          Navigator.pushNamed(context, '/measurementUnits');
        }
        if (firstText == 'Warehouses') {
          Navigator.pushNamed(context, '/warehouses');
        }
        if (firstText == 'Purchase') {
          Navigator.pushNamed(context, '/purchase');
        }
        if (firstText == 'Users' && secondText == 'Management') {
          Navigator.pushNamed(context, '/user');
        }
        if (firstText == 'Users' && secondText == '') {
          Navigator.pushNamed(context, '/users');
        }
        if (firstText == 'User' && secondText == 'Actions') {
          Navigator.pushNamed(context, '/userActions');
        }
        if (firstText == 'Roles') {
          Navigator.pushNamed(context, '/roles');
        }
        if (firstText == 'Departments') {
          Navigator.pushNamed(context, '/departments');
        }
        if (firstText == 'Projects') {
          Navigator.pushNamed(context, '/projects');
        }
        if (firstText == 'Accounting') {
          Navigator.pushNamed(context, '/accounting');
        }
        if (firstText == 'Incomes') {
          Navigator.pushNamed(context, '/incomes');
        }
        if (firstText == 'Expenses') {
          Navigator.pushNamed(context, '/expenses');
        }
        if (firstText == 'Monthly' && secondText == 'Reports') {
          Navigator.pushNamed(context, '/monthlyReports');
        }
        if (firstText == 'Transfers') {
          Navigator.pushNamed(context, '/transfers');
        }
        if (firstText == 'Accounts') {
          Navigator.pushNamed(context, '/accounts');
        }
        if (firstText == 'Cart') {
          Navigator.pushNamed(context, '/cartOrders');
        }
        if (firstText == 'Place') {
          Navigator.pushNamed(context, '/place');
        }
        if (firstText == 'Tasks' && secondText == '') {
          Navigator.pushNamed(context, '/task');
        }
        if (firstText == 'Assets' && secondText == '') {
          Navigator.pushNamed(context, '/assets');
        }
        if (firstText == 'Content') {
          Navigator.pushNamed(context, '/content');
        }
        if (firstText == 'Categories') {
          Navigator.pushNamed(context, '/categories');
        }
        if (firstText == 'Tags') {
          Navigator.pushNamed(context, '/tags');
        }
        if (firstText == 'Pages') {
          Navigator.pushNamed(context, '/pages');
        }
        if (firstText == 'Articles') {
          Navigator.pushNamed(context, '/articles');
        }
        if (firstText == 'Generated' && secondText == 'Reports') {
          Navigator.pushNamed(context, '/generated');
        }
        if (firstText == 'Income' && secondText == 'Report') {
          Navigator.pushNamed(context, '/incomeReport');
        }
        if (firstText == 'Expense' && secondText == 'Report') {
          Navigator.pushNamed(context, '/expenseReport');
        }
        if (firstText == 'Users' && secondText == 'Report') {
          Navigator.pushNamed(context, '/usersReport');
        }
        if (firstText == 'User Roles' && secondText == 'Report') {
          Navigator.pushNamed(context, '/userRolesReport');
        }
        if (firstText == 'Client Projects' && secondText == 'Report') {
          Navigator.pushNamed(context, '/clientProjectsReport');
        }
        if (firstText == 'Tasks' && secondText == 'Report') {
          Navigator.pushNamed(context, '/tasksReport');
        }
        if (firstText == 'Assets' && secondText == 'Report') {
          Navigator.pushNamed(context, '/assetsReport');
        }
        if (firstText == 'Products' && secondText == 'Report') {
          Navigator.pushNamed(context, '/productsReport');
        }
        if (firstText == 'Purchase Orders' && secondText == 'Report') {
          Navigator.pushNamed(context, '/purchaseOrdersReport');
        }
        if (firstText == 'Knowlwdgebase') {
          Navigator.pushNamed(context, '/knowledgebase');
        }
        if (firstText == 'Global') {
          Navigator.pushNamed(context, '/global');
        }
        if (firstText == 'Dashboard' && secondText == 'Widgets') {
          Navigator.pushNamed(context, '/dashboardWidgets');
        }
        if (firstText == 'Dynamic' && secondText == 'Options') {
          Navigator.pushNamed(context, '/dynamicOptions');
        }
        if (firstText == 'Currencies' && secondText == '') {
          Navigator.pushNamed(context, '/currencies');
        }
        if (firstText == 'Email' && secondText == 'Templates') {
          Navigator.pushNamed(context, '/emailTemplates');
        }
        if (firstText == 'Payment' && secondText == 'Gateways') {
          Navigator.pushNamed(context, '/paymentGateways');
        }
        if (firstText == 'Taxes' && secondText == '') {
          Navigator.pushNamed(context, '/taxes');
        }
        if (firstText == 'Discounts' && secondText == '') {
          Navigator.pushNamed(context, '/discounts');
        }
        if (firstText == 'Translations' && secondText == '') {
          Navigator.pushNamed(context, '/translations');
        }
        if (firstText == 'Languages' && secondText == '') {
          Navigator.pushNamed(context, '/languages');
        }
        if (firstText == 'Database' && secondText == 'Backup') {
          Navigator.pushNamed(context, '/databaseBackup');
        }
        if (firstText == 'Site' && secondText == 'Themes') {
          Navigator.pushNamed(context, '/siteThemes');
        }
        if (firstText == 'Master' && secondText == 'Settings') {
          Navigator.pushNamed(context, '/masterSettings');
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
        if (firstText == 'All' && secondText == 'Goals') {
          Navigator.pushNamed(context, '/allGoals');
        }
        if (firstText == 'Goal' && secondText == 'Type') {
          Navigator.pushNamed(context, '/goalType');
        }
        if (firstText == 'Ticket') {
          Navigator.pushNamed(context, '/ticket');
        }
        if (firstText == 'Logout') {
          Navigator.pop(context);
        }
        if (firstText == 'Details' && secondText == '') {
          Navigator.pushNamed(context, '/details', arguments: data);
        }
        if (firstText == 'Contact' && secondText == 'Notes') {
          Navigator.pushNamed(context, '/contactNotes');
        }
        if (firstText == 'Contact' && secondText == 'Documents') {
          Navigator.pushNamed(context, '/contactDoc');
        }
        if (firstText == 'Proposals') {
          Navigator.pushNamed(context, '/proposals');
        }
        if (secondText == 'Proposal') {
          Navigator.pushNamed(context, '/addProposal');
        }
        if (firstText == 'Invoices') {
          Navigator.pushNamed(context, '/invoices');
        }
        if (firstText == 'Credit' && secondText == 'Notes') {
          Navigator.pushNamed(context, '/creditNotes');
        }
        if (firstText == 'Quotes') {
          Navigator.pushNamed(context, '/quotes');
        }
        if (firstText == 'Contracts') {
          Navigator.pushNamed(context, '/contracts');
        }
        if (firstText == 'Quick' && secondText == 'Notifications') {
          Navigator.pushNamed(context, '/quick');
        }
        if (firstText == 'Knowledgebase') {
          Navigator.pushNamed(context, '/knowledgebase');
        }
        if (firstText == 'Category') {
          Navigator.pushNamed(context, '/categoriess');
        }
        if (firstText == 'Contacts' && secondText == 'Management') {
          Navigator.pushNamed(context, '/contact');
        }
        if (firstText == 'Contacts' && secondText == '') {
          Navigator.pushNamed(context, '/contacts');
        }
        if (firstText == 'Mailchimp') {
          Navigator.pushNamed(context, '/mailchimp');
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
