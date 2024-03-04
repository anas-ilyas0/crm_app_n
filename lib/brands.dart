// ignore_for_file: avoid_print, prefer_if_null_operators, use_build_context_synchronously
import 'dart:convert';
import 'dart:developer';
import 'package:crm_new/editBrand.dart';
import 'package:crm_new/helpers/brandsDeleteApi.dart';
import 'package:crm_new/resources/components/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crm_new/models/brands_get_model.dart';

Future<List<Data>> getBrandsData() async {
  String token = AppUrl.token;
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
  var url = Uri.parse('https://testcrm.thesuperstarshop.com/api/v1/brand');

  try {
    var res = await http.get(url, headers: headers);

    if (res.statusCode == 200) {
      var jsonResponse = json.decode(res.body);
      BrandsGetModel brandsData = BrandsGetModel.fromJson(jsonResponse);
      print('Successfully Fetched Data');
      return brandsData.data;
    } else {
      print('Error: ${res.reasonPhrase}');
      return [];
    }
  } catch (e) {
    print('Exception occurred: $e');
    return [];
  }
}

class Brands extends StatefulWidget {
  const Brands({super.key});

  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  late Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = getBrandsData();
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
            'Brands',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addBrand');
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
                          DataColumn(label: Text('Title')),
                          // DataColumn(label: Text('Icon')),
                          DataColumn(label: Text('Status')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: snapshot.data!
                            .map((data) => DataRow(cells: [
                                  DataCell(Text(data.title)),
                                  // DataCell(
                                  //   CachedNetworkImage(
                                  //     width: 40,
                                  //     imageUrl:
                                  //         'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png',
                                  //     placeholder: (context, url) =>
                                  //         const CircularProgressIndicator(),
                                  //     errorWidget: (context, url, error) =>
                                  //         const Icon(Icons.error),
                                  //   ),
                                  // ),
                                  DataCell(Text(data.status)),
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
                                                  EditBrand(brandData: data),
                                            ),
                                          ).then((_) {
                                            setState(() {
                                              futureData = getBrandsData();
                                            });
                                          });
                                        }
                                        if (value == 3) {
                                          var res = await deleteBrand(
                                            data.id,
                                          );
                                          log('res statusCode : ${res.statusCode} >>> body : ${res.body}');
                                          Navigator.pushReplacementNamed(
                                              context, '/brands');
                                          setState(() {
                                            futureData = getBrandsData();
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
