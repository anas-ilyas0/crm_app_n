// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crm_new/models/language_model.dart';
import 'package:crm_new/resources/components/app_url.dart';
import 'package:flutter/material.dart';

Future<List<Data>> getLanguages() async {
  String token = AppUrl.token;
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
  var url =
      Uri.parse('https://testcrm.thesuperstarshop.com/api/v1/get-languages');

  try {
    var res = await http.get(url, headers: headers);

    if (res.statusCode == 200) {
      var jsonResponse = json.decode(res.body);
      LanguageModel languageData = LanguageModel.fromJson(jsonResponse);
      print('Successfully Fetched Data');
      return languageData.data;
    } else {
      print('Error: ${res.reasonPhrase}');
      return [];
    }
  } catch (e) {
    print('Exception occurred: $e');
    return [];
  }
}

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  late Future<List<Data>> futureData;
  @override
  void initState() {
    super.initState();
    futureData = getLanguages();
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
          'Languages',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addLanguage');
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
                        DataColumn(label: Text('Language')),
                        DataColumn(label: Text('Code')),
                        DataColumn(label: Text('Is rtl')),
                        DataColumn(label: Text('Actions')),
                      ],
                      rows: snapshot.data!
                          .map((data) => DataRow(cells: [
                                DataCell(Text(data.language)),
                                DataCell(Text(data.code)),
                                DataCell(Text(data.isRtl)),
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
                                      // if (value == 1) {
                                      //   Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           EditBrand(brandData: data),
                                      //     ),
                                      //   ).then((_) {
                                      //     setState(() {
                                      //       futureData = getBrandsData();
                                      //     });
                                      //   });
                                      // }
                                      // if (value == 3) {
                                      //   var res = await deleteBrand(
                                      //     data.id,
                                      //   );
                                      //   log('res statusCode : ${res.statusCode} >>> body : ${res.body}');
                                      //   Navigator.pushReplacementNamed(
                                      //       context, '/brands');
                                      //   setState(() {
                                      //     futureData = getBrandsData();
                                      //   });
                                      // }
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
      ),
      // body: Column(children: [
      //   const SizedBox(height: 10),
      //   Expanded(
      //     child: SingleChildScrollView(
      //       scrollDirection: Axis.vertical,
      //       child: Expanded(
      //         child: SingleChildScrollView(
      //           scrollDirection: Axis.horizontal,
      //           child: DataTable(
      //               columns: const [
      //                 DataColumn(label: Text('Language')),
      //                 DataColumn(label: Text('Code')),
      //                 DataColumn(label: Text('Is rtl')),
      //                 DataColumn(label: Text('Actions')),
      //               ],
      //               rows: List<DataRow>.generate(
      //                 7,
      //                 (index) {
      //                   return DataRow(cells: [
      //                     const DataCell(
      //                       Center(
      //                         child: Text('Hindi'),
      //                       ),
      //                     ),
      //                     const DataCell(
      //                       Center(
      //                         child: Text('hi'),
      //                       ),
      //                     ),
      //                     const DataCell(
      //                       Center(
      //                         child: Text('Yes'),
      //                       ),
      //                     ),
      //                     DataCell(Center(
      //                       child: PopupMenuButton(
      //                           itemBuilder: (context) => [
      //                                 PopupMenuItem(
      //                                     value: 1,
      //                                     child: const Text('Edit'),
      //                                     onTap: () {}),
      //                                 PopupMenuItem(
      //                                     value: 2,
      //                                     child: const Text('View'),
      //                                     onTap: () {}),
      //                                 PopupMenuItem(
      //                                     value: 2,
      //                                     child: const Text('Make default'),
      //                                     onTap: () {}),
      //                                 PopupMenuItem(
      //                                     value: 2,
      //                                     child: const Text('RTL'),
      //                                     onTap: () {}),
      //                                 PopupMenuItem(
      //                                     value: 2,
      //                                     child: const Text('Delete'),
      //                                     onTap: () {}),
      //                               ]),
      //                     ))
      //                   ]);
      //                 },
      //               )),
      //         ),
      //       ),
      //     ),
      //   ),
      // ])
    );
  }
}
