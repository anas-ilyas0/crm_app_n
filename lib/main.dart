import 'package:crm_new/accounting.dart';
import 'package:crm_new/all_registered_leads.dart';
import 'package:crm_new/assets_management.dart';
import 'package:crm_new/cart_orders.dart';
import 'package:crm_new/contact_management.dart';
import 'package:crm_new/content_management.dart';
import 'package:crm_new/create_lead.dart';
import 'package:crm_new/dashboard.dart';
import 'package:crm_new/generated_reports.dart';
import 'package:crm_new/global_settings.dart';
import 'package:crm_new/goals.dart';
import 'package:crm_new/home.dart';
import 'package:crm_new/knowledgebase.dart';
import 'package:crm_new/leads.dart';
import 'package:crm_new/messages.dart';
import 'package:crm_new/plugins.dart';
import 'package:crm_new/product_management.dart';
import 'package:crm_new/projects.dart';
import 'package:crm_new/providers/user_provider.dart';
import 'package:crm_new/purchase_orders.dart';
import 'package:crm_new/quick_notifications.dart';
import 'package:crm_new/recurring_invoices.dart';
import 'package:crm_new/sales.dart';
import 'package:crm_new/task_management.dart';
import 'package:crm_new/ticket.dart';
import 'package:crm_new/todo.dart';
import 'package:crm_new/user_managements.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        )
      ],
      child: MaterialApp(home: const Home(), routes: {
        '/home': (context) => const Home(),
        '/dashboard': (context) => const Dashboard(),
        '/leads': (context) => const Leads(),
        '/sales': (context) => const Sales(),
        '/recurring': (context) => const RecurringInvoices(),
        '/product': (context) => const ProductManagement(),
        '/purchase': (context) => const PurchaseOrders(),
        '/contact': (context) => const ContactManagement(),
        '/user': (context) => const UserManagement(),
        '/projects': (context) => const Projects(),
        '/accounting': (context) => const Accounting(),
        '/cart': (context) => const CartOrders(),
        '/task': (context) => const TaskManagement(),
        '/assets': (context) => const AssetsManagement(),
        '/content': (context) => const ContentManagement(),
        '/generated': (context) => const GeneratedReports(),
        '/quick': (context) => const QuickNotifications(),
        '/knowledgebase': (context) => const Knowledgebase(),
        '/global': (context) => const GlobalSettings(),
        '/plugins': (context) => const Plugins(),
        '/messages': (context) => const Messages(),
        '/todo': (context) => const Todo(),
        '/goals': (context) => const Goals(),
        '/ticket': (context) => const Ticket(),
        '/create': (context) => const CreateLead(),
        '/allLeads': (context) => AllLeads(),
      }),
    );
  }
}
