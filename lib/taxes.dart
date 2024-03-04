// ignore_for_file: avoid_print, use_build_context_synchronously
import 'dart:convert';
import 'dart:developer';
import 'package:crm_new/editTax.dart';
import 'package:crm_new/helpers/taxDeleteApi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crm_new/models/tax_get_model.dart';

Future<List<Data>> getTaxesData() async {
  var headers = {
    'Accept': 'application/json',
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZWZiNTAyOWExZDcxZTE3NGRlN2Q2NDUwN2FhM2E5MGEyMDhlZTE3YTU2ZDRkOGU0MTJlNDI4NTcxNDQwNWM0MDRiMDU5OTk3MDhmMWIwNGQiLCJpYXQiOjE3MDk0Njk0NTcuNzc3Njk4MDQwMDA4NTQ0OTIxODc1LCJuYmYiOjE3MDk0Njk0NTcuNzc3Njk4OTkzNjgyODYxMzI4MTI1LCJleHAiOjE3NDEwMDU0NTcuNzczOTYzOTI4MjIyNjU2MjUsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.j1g1hfHtB1ywsaW4mTzge71xDij4UKPY7cuIODVQpxPkL174sxDlTolbO2h_cItKDKy1-1v9Bil3R84AVDx5_ZS7BfnPr68beKfk0sw9W8e26oohnnLkoQVbKluL3CJNv4y2Py8JOt7hHN4wkcAJ-g1RwxiTFO71YiDe9JEDyUlAOhEIUEvI8Nb_b6AIGSKjEe-ESyZeUp_kLTeztIhmZEFHsW0_RqK7Omgcuf04BdIa6In0aHxxz7godjPdRRNL5bPmK4VryR3WenRFHwFWWyKRoedFqtlugTS43YeutqPMErLCrUt7VFxc-d6B8sSF7mI4X8YIZoaunQQdLFy94b1YanSW-zTp8DT6GIQZkQHbRWM3xp-evpY3qKZxRmN2Ki42cYA9wVaCvGZgKZw-QYSOB39Vzs1jvb8QKCrpJ2CPK1wj8pXNeywzsn46nUweg0PUz8lUz0jT0eAcj_dMAJB8AZmMkxqAPr17JrVqY8jVgiPtC5fXXKANphOnQyk9cSjIM6CPTzR1z_oUAMPXf4sDivcJOCQXXsi49omAX9ddMFnb0P_L18uraHHr6QP1qL3am1i3ITeAa_NTo0fI6iNSX2LyWKlNNePCCvoFl01ZXbnnP_HhT5hWqxjbIXLBvIl0h-Rjaakde-ke0bPCNg2k7vnUTbZZBLl8Wiclnjw'
  };
  var url = Uri.parse('https://testcrm.thesuperstarshop.com/api/v1/taxes');

  try {
    var res = await http.get(url, headers: headers);

    if (res.statusCode == 200) {
      var jsonResponse = json.decode(res.body);
      TaxesGetModel taxesData = TaxesGetModel.fromJson(jsonResponse);
      print('Successfully Fetched Data${jsonResponse}');
      return taxesData.data;
    } else {
      print('Error: ${res.reasonPhrase}');
      return [];
    }
  } catch (e) {
    print('Exception occurred: $e');
    return [];
  }
}

class Taxes extends StatefulWidget {
  const Taxes({super.key});

  @override
  State<Taxes> createState() => _TaxesState();
}

class _TaxesState extends State<Taxes> {
  late Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = getTaxesData();
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
            'Taxes',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addTax');
                },
                icon: const Icon(
                  Icons.add_circle_rounded,
                  color: Colors.white,
                ))
          ],
          // bottom: const TabBar(
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
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
                          DataColumn(label: Text('Rate')),
                          DataColumn(label: Text('Rate type')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: snapshot.data!
                            .map((data) => DataRow(cells: [
                                  DataCell(Text(data.name)),
                                  DataCell(Text('\$${data.rate.toString()}')),
                                  DataCell(Text(data.rateType)),
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
                                                  EditTax(taxesData: data),
                                            ),
                                          ).then((_) {
                                            setState(() {
                                              futureData = getTaxesData();
                                            });
                                          });
                                        }
                                        if (value == 3) {
                                          var res = await deleteTax(
                                            data.id,
                                          );
                                          log('res statusCode : ${res.statusCode} >>> body : ${res.body}');
                                          Navigator.pushReplacementNamed(
                                              context, '/taxes');
                                          setState(() {
                                            futureData = getTaxesData();
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
