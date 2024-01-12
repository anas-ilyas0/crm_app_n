// ignore_for_file: file_names

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MonthlyReports extends StatefulWidget {
  const MonthlyReports({super.key});

  @override
  State<MonthlyReports> createState() => _MonthlyReportsState();
}

class _MonthlyReportsState extends State<MonthlyReports> {
  String month = '';
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  String year = '';
  List<String> years = ['2023', '2022', '2021', '2020', '2019', '2018', '2017'];
  @override
  Widget build(BuildContext context) {
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
          'Monthly Reports',
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
              const SizedBox(height: 25, child: Text('Year')),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                hint:
                    const Text('Please select', style: TextStyle(fontSize: 14)),
                items: years
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  year = value.toString();
                },
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Month')),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                hint:
                    const Text('Please select', style: TextStyle(fontSize: 14)),
                items: months
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  month = value.toString();
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'View Report',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              const SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Income')),
                      DataColumn(label: Text('Income by category')),
                      DataColumn(label: Text('Expenses')),
                      DataColumn(label: Text('Expenses by category')),
                      DataColumn(label: Text('Profit')),
                    ],
                    rows: List<DataRow>.generate(
                      4,
                      (index) {
                        return const DataRow(cells: [
                          DataCell(
                            Center(
                              child: Text('\$346'),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text('\$123'),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text('\$432'),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text('\$100'),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Text('\$200'),
                            ),
                          ),
                        ]);
                      },
                    )),
              ),
              const SizedBox(height: 30),
              SfCartesianChart(
                  title: const ChartTitle(
                      text: 'Income Report',
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
              const SizedBox(height: 20),
              SfCartesianChart(
                  title: const ChartTitle(
                      text: 'Expense Report',
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
              const SizedBox(height: 20),
              SfCartesianChart(
                  title: const ChartTitle(
                      text: 'Income Report Pie',
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
              const SizedBox(height: 20),
              SfCartesianChart(
                  title: const ChartTitle(
                      text: 'Expense Report Pie',
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
