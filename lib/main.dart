import 'package:crm_new/accounting.dart';
import 'package:crm_new/addProject.dart';
import 'package:crm_new/add_Contact.dart';
import 'package:crm_new/add_Contract.dart';
import 'package:crm_new/add_Credit.dart';
import 'package:crm_new/add_Department.dart';
import 'package:crm_new/add_Product.dart';
import 'package:crm_new/add_Proposal.dart';
import 'package:crm_new/add_Purchase_Order.dart';
import 'package:crm_new/add_Quote.dart';
import 'package:crm_new/add_Recurring_Invoice.dart';
import 'package:crm_new/add_Recurring_Period.dart';
import 'package:crm_new/add_Role.dart';
import 'package:crm_new/add_Warehouse.dart';
import 'package:crm_new/all_registered_leads.dart';
import 'package:crm_new/assets_management.dart';
import 'package:crm_new/cart_orders.dart';
import 'package:crm_new/contact_doc.dart';
import 'package:crm_new/contacts_management.dart';
import 'package:crm_new/contact_notes.dart';
import 'package:crm_new/contacts.dart';
import 'package:crm_new/content_management.dart';
import 'package:crm_new/contracts.dart';
import 'package:crm_new/create_lead.dart';
import 'package:crm_new/credit_notes.dart';
import 'package:crm_new/dashboard.dart';
import 'package:crm_new/departments.dart';
import 'package:crm_new/generated_reports.dart';
import 'package:crm_new/global_settings.dart';
import 'package:crm_new/goals.dart';
import 'package:crm_new/home.dart';
import 'package:crm_new/invoices.dart';
import 'package:crm_new/knowledgebase.dart';
import 'package:crm_new/lead_details.dart';
import 'package:crm_new/login.dart';
import 'package:crm_new/mailchimp.dart';
import 'package:crm_new/messages.dart';
import 'package:crm_new/new_invoice.dart';
import 'package:crm_new/plugins.dart';
import 'package:crm_new/product_management.dart';
import 'package:crm_new/products.dart';
import 'package:crm_new/products_Transfer.dart';
import 'package:crm_new/projects.dart';
import 'package:crm_new/proposals.dart';
import 'package:crm_new/providers/user_provider.dart';
import 'package:crm_new/purchase_orders.dart';
import 'package:crm_new/quick_notifications.dart';
import 'package:crm_new/quotes.dart';
import 'package:crm_new/recuring_invoices.dart';
import 'package:crm_new/recurring_invoices.dart';
import 'package:crm_new/recurring_periods.dart';
import 'package:crm_new/roles.dart';
import 'package:crm_new/sales.dart';
import 'package:crm_new/task_management.dart';
import 'package:crm_new/ticket.dart';
import 'package:crm_new/todo.dart';
import 'package:crm_new/user_Actions.dart';
import 'package:crm_new/users.dart';
import 'package:crm_new/users_managements.dart';
import 'package:crm_new/view_Credit.dart';
import 'package:crm_new/view_Quote.dart';
import 'package:crm_new/view_Recurring_Invoice.dart';
import 'package:crm_new/view_Recurring_Period.dart';
import 'package:crm_new/view_contract.dart';
import 'package:crm_new/view_lead.dart';
import 'package:crm_new/view_proposal.dart';
import 'package:crm_new/warehouses.dart';
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
      child: MaterialApp(home: const Login(), routes: {
        '/login': (context) => const Login(),
        '/home': (context) => const Home(username: ''),
        '/dashboard': (context) => const Dashboard(),
        '/sales': (context) => const Sales(),
        '/recuring': (context) => const RecuringInvoices(),
        '/recurringInvoices': (context) => const RecurringInvoices(),
        '/addRecurringInvoice': (context) => const AddRecurringInvoice(),
        '/viewRecurringInvoices': (context) => const ViewRecurringInvoice(),
        '/recurringPeriods': (context) => const RecurringPeriods(),
        '/addRecurringPeriod': (context) => const AddRecurringPeriod(),
        '/viewRecurringPeriod': (context) => const ViewRecurringPeriod(),
        '/product': (context) => const ProductManagement(),
        '/products': (context) => const Products(),
        '/addProduct': (context) => const AddProduct(),
        '/productsTransfer': (context) => const ProductsTransfer(),
        '/warehouses': (context) => const Warehouses(),
        '/addWarehouse': (context) => const AddWarehouse(),
        '/purchase': (context) => const PurchaseOrders(),
        '/addPurchaseOrder': (context) => const AddPurchaseOrder(),
        '/contact': (context) => const ContactManagement(),
        '/contacts': (context) => const Contacts(),
        '/addContact': (context) => const AddContact(),
        '/mailchimp': (context) => const Mailchimp(),
        '/user': (context) => const UserManagement(),
        '/users': (context) => const Users(),
        '/userActions': (context) => const UserActions(),
        '/roles': (context) => const Roles(),
        '/addRole': (context) => const AddRole(),
        '/departments': (context) => const Departments(),
        '/addDepartment': (context) => const AddDepartment(),
        '/projects': (context) => const Projects(),
        '/addProject': (context) => const AddProject(),
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
        '/allLeads': (context) => const AllLeads(),
        '/create': (context) => const CreateLead(),
        '/view': (context) => const ViewLead(),
        '/details': (context) => const LeadDetils(),
        '/contactNotes': (context) => const ContactNotes(),
        '/contactDoc': (context) => const ContactDocuments(),
        '/proposals': (context) => const Proposals(),
        '/addProposal': (context) => const AddProposal(),
        '/contracts': (context) => const Contracts(),
        '/addContract': (context) => const AddContract(),
        '/viewContract': (context) => const ViewContract(),
        '/invoices': (context) => const Invoices(),
        '/newInvoice': (context) => const NewInvoice(),
        '/creditNotes': (context) => const CreditNotes(),
        '/addCredit': (context) => const AddCredit(),
        '/viewCredit': (context) => const ViewCredit(),
        '/quotes': (context) => const Quotes(),
        '/addQuote': (context) => const AddQuote(),
        '/viewQuote': (context) => const ViewQuote(),
        '/viewProposal': (context) => const ViewProposal(),
      }),
    );
  }
}
