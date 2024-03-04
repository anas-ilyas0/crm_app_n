// ignore_for_file: avoid_print, use_build_context_synchronously
import 'dart:convert';
import 'dart:developer';
import 'package:crm_new/editWarehouse.dart';
import 'package:crm_new/resources/components/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crm_new/helpers/warehouseDeleteApi.dart';
import 'package:crm_new/models/warehouses_get_model.dart';

Future<List<Data>> getWarehousesData() async {
  String token = AppUrl.token;
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
  var url = Uri.parse('https://testcrm.thesuperstarshop.com/api/v1/warehouses');

  try {
    var res = await http.get(url, headers: headers);

    if (res.statusCode == 200) {
      var jsonResponse = json.decode(res.body);
      WarehousesGetModel warehousesData =
          WarehousesGetModel.fromJson(jsonResponse);
      print('Successfully Fetched Data');
      return warehousesData.data;
    } else {
      print('Error: ${res.reasonPhrase}');
      return [];
    }
  } catch (e) {
    print('Exception occurred: $e');
    return [];
  }
}

class Warehouses extends StatefulWidget {
  const Warehouses({super.key});

  @override
  State<Warehouses> createState() => _WarehousesState();
}

class _WarehousesState extends State<Warehouses> {
  late Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = getWarehousesData();
  }

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
            'Warehouses',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addWarehouse');
                },
                icon: const Icon(
                  Icons.add_circle_rounded,
                  color: Colors.white,
                ))
          ],
          // bottom: const TabBar(
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(children: [
            FutureBuilder<List<Data>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Expanded(
                    child: Center(child: Text('Error: ${snapshot.error}')),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Expanded(
                    child: Center(child: Text('No data available.')),
                  );
                }
                return Expanded(
                    child: SingleChildScrollView(
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: snapshot.data!
                            .map((data) => DataRow(cells: [
                                  DataCell(Text(data.name)),
                                  DataCell(Center(
                                    child: PopupMenuButton(
                                      itemBuilder: (context) => const [
                                        PopupMenuItem(
                                          value: 1,
                                          child: Text('Edit'),
                                        ),
                                        PopupMenuItem(
                                          value: 2,
                                          child: Text('View'),
                                        ),
                                        PopupMenuItem(
                                          value: 3,
                                          child: Text('Delete'),
                                        )
                                      ],
                                      onSelected: (value) async {
                                        if (value == 1) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EditWarehouse(
                                                      warehouseData: data),
                                            ),
                                          ).then((_) {
                                            setState(() {
                                              futureData = getWarehousesData();
                                            });
                                          });
                                        }
                                        if (value == 3) {
                                          var res = await deleteWarehouse(
                                            data.id,
                                          );
                                          log('res statusCode : ${res.statusCode} >>> body : ${res.body}');
                                          Navigator.pushReplacementNamed(
                                              context, '/warehouses');
                                          setState(() {
                                            futureData = getWarehousesData();
                                          });
                                        }
                                      },
                                    ),
                                  )),
                                ]))
                            .toList(),
                      ),
                    ),
                  ),
                ));
              },
            ),
          ]),
        ));
  }
}
