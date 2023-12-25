import 'package:crm_new/home.dart';
import 'package:flutter/material.dart';

class GeneratedReports extends StatefulWidget {
  const GeneratedReports({super.key});

  @override
  State<GeneratedReports> createState() => _GeneratedReportsState();
}

class _GeneratedReportsState extends State<GeneratedReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Generated Reports',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.4),
              children: const [
                GridTileofApp(
                    image: 'images/incomeReport.png',
                    firstText: 'Income',
                    secondText: 'Report'),
                GridTileofApp(
                    image: 'images/expenseReport.png',
                    firstText: 'Expense',
                    secondText: 'Report'),
                GridTileofApp(
                    image: 'images/usersReport.png',
                    firstText: 'Users',
                    secondText: 'Report'),
                GridTileofApp(
                    image: 'images/userRolesReport.png',
                    firstText: 'User Roles',
                    secondText: 'Report'),
                GridTileofApp(
                    image: 'images/clientProjectReports.png',
                    firstText: 'Client Projects',
                    secondText: 'Report'),
                GridTileofApp(
                    image: 'images/tasksReport.png',
                    firstText: 'Tasks',
                    secondText: 'Report'),
                GridTileofApp(
                    image: 'images/assetsReport.png',
                    firstText: 'Assets',
                    secondText: 'Report'),
                GridTileofApp(
                    image: 'images/productsReport.png',
                    firstText: 'Products',
                    secondText: 'Report'),
                GridTileofApp(
                    image: 'images/purchaseOrderReport.png',
                    firstText: 'Purchase Orders',
                    secondText: 'Report'),
              ]),
        ),
      ),
    );
  }
}
