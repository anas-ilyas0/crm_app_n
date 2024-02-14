// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crm_new/models/categories_get_model.dart';

Future<List<Data>> getCategories() async {
  var headers = {
    'Accept': 'application/json',
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjExYzgyZTYwMDVhNzBhMWNmMDY3ODljNjQ1NWZiZTJmYjRiMTY2ZDI0ZTZjZWJiZTFiY2E5NmY5YmU1MDA0MDFlZTQ1ZGZhNjQyN2Q5ZjEiLCJpYXQiOjE3MDU5MjA3ODcuNTQ1OTcwOTE2NzQ4MDQ2ODc1LCJuYmYiOjE3MDU5MjA3ODcuNTQ1OTc0MDE2MTg5NTc1MTk1MzEyNSwiZXhwIjoxNzM3NTQzMTg3LjIwMjc4MDAwODMxNjA0MDAzOTA2MjUsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.UzSoLgUka5KRa3roCrOYXlOF6yI07CUDv-jzdZeG47THIbZlRMTb6fQ5ARCw4cSoX-BmuycfzD1gwGyFnRt6c6sCrjEWUUOEi8UyaDAqMN8oYLV2Eytk4s-kiJtgQtS0-mN9nPvin1veprmJFx7TMZsoad5menF0Ddut-nme7aKR25-3WbcHXzqE8Rbxzw1nMMhe4rmtQ92HHIt2Y7WfKxLHgW21aN2PirhnPZZGNmjOBlW85R1f58opctBjwU8ZRu1sxed-T-9yhb_ZP4MxlNCFyI3tKAj_Ecds3FI_KHqFSPG94herlu1dkSH--YBXV38g1756Ct9eYojzvdBgBnwlEWrk7y6r8UyCVNP10E-5dVGnQR5UJWCiw8WdKh84ovgq2jquWxHOXSSO9lLGa5_yFOcp_ITQXU6BayPIsqd3M0OZOzYAhj1y05kKfeZ3NMKwlRPs97Udri1laW7s77BASO_AiHjl_oKnEuo76o3mEYy_fWSbpDcXuFkn5cBDSFlB0k0Pn5EGFzsP-It-G8mk7vH2oxj9WZ4RQLADwxgoCvM3gKNX1pVneHVFf3HomQhpDmJ4PqPwXJZqtlvChbYmJu0uYR6nvrvlb5wSVCSEwUAS59LgCAkmDFVFKoTdNVP6rMYdm-0yKGWY-9_NfAqib6adTuwcggaUtOEItus',
    'Cookie':
        'XSRF-TOKEN=eyJpdiI6Ik5KQUFGeDJna0k2TU9aZFZsdml4ZVE9PSIsInZhbHVlIjoicGoydFRQRmJ0eE1MWUhHVzhvdTljZzVUS2g0NCtNYmYvdStUa3R3ZjZ0Y1Fwc2NSRkFpdTZMUEJqK29pSEJWVVZpSXZxdVRudjhvRWpOL0JTeGx2Y1BkdGZZTU5JbG1BQnF0YVNUVTlSS09iejJqS0xHNGxVdW83M1RPL3VncTkiLCJtYWMiOiI3NmJmODdhZjA5Y2JkNDZiMjhmMjM0NzIwNTQ0YjA3MjEzNDI1ZTNkY2FjYTYwOGUyNzI3ZjBiZDgzYmYyZGJlIiwidGFnIjoiIn0%3D; crm_session=eyJpdiI6IjRINjRJUzRaVWlnRk10QWhRMjR2Y3c9PSIsInZhbHVlIjoiYnd5QU5uaTBUZ21RSjU4U01tSWtJZ0hwTGJQQ1lVTE1GeDJvbG1mayswcjZScEUzNjdjUnQ4M2RHbEdlK1UyUk1vaW1ZeTRTWUJIdnVTSVJYT1FBaklNSDY2L1hWajlzcDBCZ1h4R0JTa1lTaFlIUjg3T0xzUE10dE5MemdncHIiLCJtYWMiOiI0MGZiZWM0ZWFjOGNhMTNkZTcyMjNjNDg4OTcwY2EwN2Y1MjE0YmU5Mzc2NTk3ZGM2ODYxY2U0NGZlZmJjOGMyIiwidGFnIjoiIn0%3D'
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
          Expanded(
              child: SingleChildScrollView(
            child: Center(
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(columns: const [
                    DataColumn(label: Text('Category')),
                    DataColumn(label: Text('Photo')),
                    DataColumn(label: Text('Actions')),
                  ], rows: [
                    // snapshot.data!
                    //     .map((data) =>
                    DataRow(cells: [
                      const DataCell(Text('Brand')),
                      const DataCell(
                        Center(
                          child: Text('Photo'),
                        ),
                      ),
                      DataCell(Center(
                        child: PopupMenuButton(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                value: 3,
                                child: const Text('Edit'),
                                onTap: () {}),
                            PopupMenuItem(
                              value: 4,
                              child: const Text('View'),
                              onTap: () {},
                            ),
                            const PopupMenuItem(value: 5, child: Text('Delete'))
                          ],
                          // onSelected: (value) async {
                          //   if (value == 3) {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) =>
                          //             EditLead(leadData: data),
                          //       ),
                          //     ).then((_) {
                          //       setState(() {
                          //         futureData = getLeadsData();
                          //       });
                          //     });
                          //   }
                          //   if (value == 4) {
                          //     Navigator.pushNamed(context, '/view',
                          //         arguments: data);
                          //   }
                          //   if (value == 5) {
                          //     var res = await deleteLead(
                          //       data.id,
                          //     );
                          //     log('res statusCode : ${res.statusCode} >>> body : ${res.body}');
                          //     Navigator.pushReplacementNamed(
                          //         context, '/allLeads');
                          //     setState(() {
                          //       futureData = getLeadsData();
                          //     });
                          //   }
                          // },
                        ),
                      )),
                    ])
                  ])
                  //.toList(),
                  ),
            ),
          ))
          // FutureBuilder<List<Data>>(
          //   future: futureData,
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const Expanded(
          //         child: Center(
          //           child: CircularProgressIndicator(
          //             color: Colors.blue,
          //           ),
          //         ),
          //       );
          //     } else if (snapshot.hasError) {
          //       return Expanded(
          //         child: Center(child: Text('Error: ${snapshot.error}')),
          //       );
          //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          //       return const Expanded(
          //         child: Center(child: Text('No data available.')),
          //       );
          //     }
          //     return Expanded(
          //       child: SingleChildScrollView(
          //         child: Center(
          //           child: SingleChildScrollView(
          //             scrollDirection: Axis.horizontal,
          //             child: DataTable(
          //               columns: const [
          //                 DataColumn(label: Text('Category')),
          //                 DataColumn(label: Text('Photo')),
          //                 DataColumn(label: Text('Actions')),
          //               ],
          //               rows: snapshot.data!
          //                   .map((data) => DataRow(cells: [
          //                         DataCell(Text(data.name)),
          //                         DataCell(
          //                           Center(
          //                             child: Text(data.photo),
          //                           ),
          //                         ),
          //                         DataCell(Center(
          //                           child: PopupMenuButton(
          //                             itemBuilder: (context) => const [
          //                               PopupMenuItem(
          //                                 value: 1,
          //                                 child: Text('Edit'),
          //                               ),
          //                               PopupMenuItem(
          //                                 value: 2,
          //                                 child: Text('View'),
          //                               ),
          //                               PopupMenuItem(
          //                                 value: 3,
          //                                 child: Text('Delete'),
          //                               )
          //                             ],
          //                             onSelected: (value) async {
          //                               if (value == 1) {
          //                                 Navigator.push(
          //                                   context,
          //                                   MaterialPageRoute(
          //                                     builder: (context) =>
          //                                         EditCategory(
          //                                             categoryData: data),
          //                                   ),
          //                                 ).then((_) {
          //                                   setState(() {
          //                                     futureData = getCategories();
          //                                   });
          //                                 });
          //                               } else if (value == 2) {
          //                                 Navigator.pushNamed(
          //                                     context, '/viewCategory');
          //                               } else if (value == 3) {
          //                                 var res =
          //                                     await deleteCategory(data.id);
          //                                 log('res statusCode : ${res.statusCode} >>> body : ${res.body}');
          //                                 // Navigator.pushReplacementNamed(
          //                                 //     context, '/categories');
          //                                 setState(() {
          //                                   futureData = getCategories();
          //                                 });
          //                               }
          //                             },
          //                           ),
          //                         )),
          //                       ]))
          //                   .toList(),
          //             ),
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ]),
      ),
    );
  }
}
