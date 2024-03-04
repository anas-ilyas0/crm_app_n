// ignore_for_file: file_names, avoid_print
import 'dart:convert';
import 'dart:developer';
import 'package:crm_new/edit_business_list.dart';
import 'package:crm_new/helpers/businessDeleteApi.dart';
import 'package:crm_new/models/business_get_model.dart';
import 'package:crm_new/resources/components/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Data>> getBusinessData() async {
  String token = AppUrl.token;
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
  var url = Uri.parse('https://testcrm.thesuperstarshop.com/api/v1/business');

  try {
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      BusinessGetModel businessData = BusinessGetModel.fromJson(jsonResponse);
      return businessData.data;
    } else {
      print('Error: ${response.reasonPhrase}');
      return [];
    }
  } catch (e) {
    print('Exception occurred: $e');
    return [];
  }
}

class BusinessList extends StatefulWidget {
  const BusinessList({super.key});

  @override
  State<BusinessList> createState() => _BusinessListState();
}

class _BusinessListState extends State<BusinessList> {
  late Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = getBusinessData();
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
            'Business List',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addBusinessList');
                },
                icon: const Icon(
                  Icons.add_circle_rounded,
                  color: Colors.white,
                ))
          ],
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
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Business Name')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: snapshot.data!
                          .map((data) => DataRow(cells: [
                                DataCell(Text(data.businessName)),
                                DataCell(Center(
                                  child: PopupMenuButton(
                                    itemBuilder: (context) => const [
                                      PopupMenuItem(
                                        value: 1,
                                        child: Text('Edit'),
                                      ),
                                      PopupMenuItem(
                                        value: 2,
                                        child: Text('Delete'),
                                      )
                                    ],
                                    onSelected: (value) async {
                                      if (value == 1) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditBusinessList(
                                                    businessData: data),
                                          ),
                                        ).then((_) {
                                          setState(() {
                                            futureData = getBusinessData();
                                          });
                                        });
                                      }
                                      if (value == 2) {
                                        var res = await deleteBusiness(
                                          data.id,
                                        );
                                        log('res statusCode : ${res.statusCode} >>> body : ${res.body}');
                                        // Navigator.pushReplacementNamed(
                                        //     context, '/businessList');
                                        setState(() {
                                          futureData = getBusinessData();
                                        });
                                      }
                                    },
                                  ),
                                )),
                              ]))
                          .toList(),
                    ),
                  ),
                ));
              },
            ),
          ]),
        ));
  }
}
