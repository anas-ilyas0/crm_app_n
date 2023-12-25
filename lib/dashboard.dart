import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color(0xFFF4F9FD),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(0)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      height: 280,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Column(children: [
                        Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              'Summary',
                              style: Theme.of(context).textTheme.titleLarge,
                            )),
                        ListTile(
                          leading: const Icon(Icons.people, color: Colors.blue),
                          title: const Text('Users'),
                          trailing: const Text('5'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.vertical_distribute,
                            color: Colors.amber,
                          ),
                          title: const Text('Expense Amount'),
                          trailing: const Text('\$0.00'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.production_quantity_limits,
                            color: Colors.cyan,
                          ),
                          title: const Text('Products'),
                          trailing: const Text('12'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                            FontAwesomeIcons.dollarSign,
                            color: Colors.lightGreen,
                          ),
                          title: const Text('Income Amount'),
                          trailing: const Text('\$1279.80'),
                          onTap: () {},
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SfCartesianChart(
                  title: const ChartTitle(
                      text: 'Contacts',
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  primaryXAxis: const CategoryAxis(
                    title: AxisTitle(text: ''),
                  ),
                  primaryYAxis: const NumericAxis(
                    title: AxisTitle(text: ''),
                  ),
                  series: [
                    ColumnSeries<SalesData, String>(
                      dataSource: getColumnData(),
                      xValueMapper: (SalesData sales, _) => sales.x,
                      yValueMapper: (SalesData sales, _) => sales.y,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                      ),
                    )
                  ]),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SfCartesianChart(
                  title: const ChartTitle(
                      text: 'Expenses Category',
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  primaryXAxis: const CategoryAxis(
                    title: AxisTitle(text: ''),
                  ),
                  primaryYAxis: const NumericAxis(
                    title: AxisTitle(text: ''),
                  ),
                  series: [
                    ColumnSeries<SalesData, String>(
                      dataSource: getColumnData2(),
                      xValueMapper: (SalesData sales, _) => sales.x,
                      yValueMapper: (SalesData sales, _) => sales.y,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                      ),
                    )
                  ]),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SfCartesianChart(
                  title: const ChartTitle(
                      text: 'Incomes Category',
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  primaryXAxis: const CategoryAxis(
                    title: AxisTitle(text: ''),
                  ),
                  primaryYAxis: const NumericAxis(
                    title: AxisTitle(text: ''),
                  ),
                  series: [
                    ColumnSeries<SalesData, String>(
                      dataSource: getColumnData3(),
                      xValueMapper: (SalesData sales, _) => sales.x,
                      yValueMapper: (SalesData sales, _) => sales.y,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                      ),
                    )
                  ]),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SfCartesianChart(
                  title: const ChartTitle(
                      text: 'Last 12 Months Income',
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  primaryXAxis: const CategoryAxis(
                    title: AxisTitle(text: ''),
                  ),
                  primaryYAxis: const NumericAxis(
                    title: AxisTitle(text: ''),
                  ),
                  series: [
                    ColumnSeries<SalesData, String>(
                      dataSource: getColumnData4(),
                      xValueMapper: (SalesData sales, _) => sales.x,
                      yValueMapper: (SalesData sales, _) => sales.y,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                      ),
                    )
                  ]),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SfCartesianChart(
                  title: const ChartTitle(
                      text: 'Yearly Invoices Amount',
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  primaryXAxis: const CategoryAxis(
                    title: AxisTitle(text: ''),
                  ),
                  primaryYAxis: const NumericAxis(
                    title: AxisTitle(text: ''),
                  ),
                  series: [
                    ColumnSeries<SalesData, String>(
                      dataSource: getColumnData5(),
                      xValueMapper: (SalesData sales, _) => sales.x,
                      yValueMapper: (SalesData sales, _) => sales.y,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                      ),
                    )
                  ]),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SfCartesianChart(
                  title: const ChartTitle(
                      text: 'Yearly Orders Amount',
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  primaryXAxis: const CategoryAxis(
                    title: AxisTitle(text: ''),
                  ),
                  primaryYAxis: const NumericAxis(
                    title: AxisTitle(text: ''),
                  ),
                  series: [
                    ColumnSeries<SalesData, String>(
                      dataSource: getColumnData6(),
                      xValueMapper: (SalesData sales, _) => sales.x,
                      yValueMapper: (SalesData sales, _) => sales.y,
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

class SalesData {
  String x;
  double y;
  SalesData(this.x, this.y);
}

dynamic getColumnData() {
  List<SalesData> columnData = <SalesData>[
    SalesData('Project Manager', 37),
    SalesData('Stock Manager', 42),
    SalesData('Admin', 39),
    SalesData('Client', 51),
    SalesData('Lead', 4),
    SalesData('Employee', 30),
    SalesData('Executive', 40),
    SalesData('Supplier', 60),
    SalesData('Customer', 35),
    SalesData('Business Manager', 10),
    SalesData('Sales Manager', 20),
    SalesData('Sale Agent', 30),
  ];
  return columnData;
}

dynamic getColumnData2() {
  List<SalesData> columnData2 = <SalesData>[
    SalesData('Travel Expense', 100),
    SalesData('Utility Bill Expense', 42),
    SalesData('Monthly Expenses', 39),
    SalesData('Vehicle Expense', 51),
    SalesData('Purchase Expense', 4),
    SalesData('Sports Expense', 30),
    SalesData('Daily Expense', 40),
    SalesData('Property Taxes', 60),
    SalesData('Salary', 35),
  ];
  return columnData2;
}

dynamic getColumnData3() {
  List<SalesData> columnData3 = <SalesData>[
    SalesData('Capital Income', 10),
    SalesData('Recurring Invoices Income', 30),
    SalesData('Projects Income', 39),
    SalesData('Invoices Income', 43),
    SalesData('Sales Income', 7),
    SalesData('Investments Income', 35),
    SalesData('Interest Income', 40),
    SalesData('Property Income', 30),
    SalesData('Offline Income', 35),
    SalesData('Orders Income', 15),
  ];
  return columnData3;
}

dynamic getColumnData4() {
  List<SalesData> columnData4 = <SalesData>[
    SalesData('January', 1),
    SalesData('Februaru', 2),
    SalesData('March', 3),
    SalesData('April', 4),
    SalesData('May', 5),
    SalesData('June', 6),
    SalesData('July', 7),
    SalesData('August', 8),
    SalesData('September', 9),
    SalesData('October', 10),
    SalesData('November', 11),
    SalesData('December', 12),
  ];
  return columnData4;
}

dynamic getColumnData5() {
  List<SalesData> columnData5 = <SalesData>[
    SalesData('2022-02', 10),
    SalesData('2022-04', 30),
    SalesData('2022-06', 39),
    SalesData('2022-08', 43),
    SalesData('2022-10', 7),
    SalesData('2022-12', 35),
  ];
  return columnData5;
}

dynamic getColumnData6() {
  List<SalesData> columnData6 = <SalesData>[
    SalesData('2022-01', 10),
    SalesData('2022-02', 30),
    SalesData('2022-03', 39),
    SalesData('2022-04', 43),
    SalesData('2022-05', 7),
    SalesData('2022-06', 35),
    SalesData('2022-07', 40),
    SalesData('2022-08', 30),
    SalesData('2022-09', 35),
    SalesData('2022-10', 15),
    SalesData('2022-11', 15),
    SalesData('2022-12', 15),
  ];
  return columnData6;
}
