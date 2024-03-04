// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:developer';
import 'package:crm_new/edit_category.dart';
import 'package:crm_new/helpers/categoriesDeleteApi.dart';
import 'package:crm_new/resources/components/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crm_new/models/categories_get_model.dart';

Future<List<Data>> getCategories() async {
  String token = AppUrl.token;
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
    'Cookie': 'XSRF-TOKEN=$token'
  };

  var url =
      Uri.parse('https://testcrm.thesuperstarshop.com/api/v1/product-category');

  try {
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      CategoriesGetModel getCategories =
          CategoriesGetModel.fromJson(jsonResponse);
      print('Successfully Fetched Data');
      return getCategories.data;
    } else {
      print(
          'Error: (statusCode ${response.statusCode}, reasonPhrase: ${response.reasonPhrase})');
      return [];
    }
  } catch (e) {
    print('Exception occurred: $e');
    return [];
  }
}

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Future<List<Data>> futureData;
  @override
  void initState() {
    super.initState();
    futureData = getCategories();
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
          'Categories',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addCategory');
              },
              icon: const Icon(
                Icons.add_circle_rounded,
                color: Colors.white,
              ))
        ],
        // bottom: const TabBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                          DataColumn(label: Text('Category')),
                          DataColumn(label: Text('Photo')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: snapshot.data!
                            .map((data) => DataRow(cells: [
                                  DataCell(Text(data.name)),
                                  DataCell(
                                    Center(
                                      child: Text(data.photo),
                                    ),
                                  ),
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
                                                  EditCategory(
                                                      categoryData: data),
                                            ),
                                          ).then((_) {
                                            setState(() {
                                              futureData = getCategories();
                                            });
                                          });
                                        } else if (value == 2) {
                                          Navigator.pushNamed(
                                              context, '/viewCategory');
                                        } else if (value == 3) {
                                          var res =
                                              await deleteCategory(data.id);
                                          log('res statusCode : ${res.statusCode} >>> body : ${res.body}');
                                          // Navigator.pushReplacementNamed(
                                          //     context, '/categories');
                                          setState(() {
                                            futureData = getCategories();
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
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
