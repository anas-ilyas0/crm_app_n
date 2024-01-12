// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class UserRolesReport extends StatefulWidget {
  const UserRolesReport({super.key});

  @override
  State<UserRolesReport> createState() => _UserRolesReportState();
}

class _UserRolesReportState extends State<UserRolesReport> {
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  String date = '';
  List<String> dates = ['Created', 'Entry date'];
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    Future pickDateRange() async {
      DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );
      if (newDateRange == null) {
        return;
      }
      setState(() {
        dateRange = newDateRange;
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'User Roles Report',
          style: TextStyle(color: Colors.white),
        ),
        // bottom: const TabBar(
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFEE6EDF5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          pickDateRange();
                        },
                        icon: const Icon(Icons.date_range, size: 30),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        DateFormat('yyyy-MM-dd').format(start),
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        width: 30,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            '-',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      ),
                      Text(
                        DateFormat('yyyy-MM-dd').format(end),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SfCartesianChart(
                  title: const ChartTitle(
                      text: 'User Roles Report',
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
            ],
          ),
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
    // SalesData('Project Manager', 37),
    // SalesData('Stock Manager', 42),
    // SalesData('Admin', 39),
    // SalesData('Client', 51),
    // SalesData('Lead', 4),
    // SalesData('Employee', 30),
    // SalesData('Executive', 40),
    // SalesData('Supplier', 60),
    // SalesData('Customer', 35),
    // SalesData('Business Manager', 10),
    // SalesData('Sales Manager', 20),
    // SalesData('Sale Agent', 30),
  ];
  return columnData;
}

dynamic getColumnData2() {
  List<SalesData> columnData2 = <SalesData>[
    // SalesData('Travel Expense', 100),
    // SalesData('Utility Bill Expense', 42),
    // SalesData('Monthly Expenses', 39),
    // SalesData('Vehicle Expense', 51),
    // SalesData('Purchase Expense', 4),
    // SalesData('Sports Expense', 30),
    // SalesData('Daily Expense', 40),
    // SalesData('Property Taxes', 60),
    // SalesData('Salary', 35),
  ];
  return columnData2;
}

dynamic getColumnData3() {
  List<SalesData> columnData3 = <SalesData>[
    // SalesData('Capital Income', 10),
    // SalesData('Recurring Invoices Income', 30),
    // SalesData('Projects Income', 39),
    // SalesData('Invoices Income', 43),
    // SalesData('Sales Income', 7),
    // SalesData('Investments Income', 35),
    // SalesData('Interest Income', 40),
    // SalesData('Property Income', 30),
    // SalesData('Offline Income', 35),
    // SalesData('Orders Income', 15),
  ];
  return columnData3;
}

dynamic getColumnData4() {
  List<SalesData> columnData4 = <SalesData>[
    // SalesData('January', 1),
    // SalesData('Februaru', 2),
    // SalesData('March', 3),
    // SalesData('April', 4),
    // SalesData('May', 5),
    // SalesData('June', 6),
    // SalesData('July', 7),
    // SalesData('August', 8),
    // SalesData('September', 9),
    // SalesData('October', 10),
    // SalesData('November', 11),
    // SalesData('December', 12),
  ];
  return columnData4;
}
