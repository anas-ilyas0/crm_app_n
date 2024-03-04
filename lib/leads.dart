// ignore_for_file: avoid_print, use_build_context_synchronously
// ignore: must_be_immutable
import 'dart:convert';
import 'dart:developer';
import 'package:crm_new/editLead.dart';
import 'package:crm_new/helpers/leadDeleteApi.dart';
import 'package:crm_new/models/leadsModel.dart';
import 'package:crm_new/resources/components/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Future<http.Response> getLeadsData() async {
//   String token = AppUrl.token;
//   String leadsURL = AppUrl.leadsURL;
//   var headers = {
//     'Accept': 'application/json',
//     'Authorization': 'Bearer $token'
//   };
//   var request = http.Request('GET', Uri.parse('$leadsURL'));

//   request.headers.addAll(headers);
//   http.StreamedResponse response = await request.send();
//   return await http.Response.fromStream(response);
// }

Future<List<Data>> getLeadsData() async {
  String token = AppUrl.token;
  String leadsURL = AppUrl.leadsURL;
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${token}'
  };
  var url = Uri.parse(leadsURL);

  try {
    var res = await http.get(url, headers: headers);

    if (res.statusCode == 200) {
      var jsonResponse = json.decode(res.body);
      LeadsModel leadsData = LeadsModel.fromJson(jsonResponse);
      print('Successfully Fetched Data${jsonResponse}');
      return leadsData.data;
    } else {
      print('Error: ${res.reasonPhrase}');
      return [];
    }
  } catch (e) {
    print('Exception occurred: ${e}');
    return [];
  }
}

class AllLeads extends StatefulWidget {
  const AllLeads({
    super.key,
  });

  @override
  State<AllLeads> createState() => _AllLeadsState();
}

class _AllLeadsState extends State<AllLeads> {
  late Future<List<Data>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = getLeadsData();
  }

  @override
  Widget build(BuildContext context) {
    //var dataProvider = Provider.of<UserProvider>(context);
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
            'Leads',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/create');
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
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Contact Type')),
                          DataColumn(label: Text('Email')),
                          DataColumn(label: Text('Address')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: snapshot.data!
                            .map((data) => DataRow(cells: [
                                  DataCell(
                                    Text(
                                        '${data.name}'), // Use 'N/A' if name is null
                                  ),
                                  DataCell(Text('${data.typeContact}')),
                                  DataCell(Text('${data.email}')),
                                  DataCell(Text('${data.fulladdress}')),
                                  DataCell(Center(
                                    child: PopupMenuButton(
                                      itemBuilder: (context) => [
                                        const PopupMenuItem(
                                            value: 1,
                                            child: Text('Create Proposal')),
                                        const PopupMenuItem(
                                            value: 2,
                                            child: Text('Send Email')),
                                        PopupMenuItem(
                                            value: 3,
                                            child: const Text('Edit'),
                                            onTap: () {}),
                                        PopupMenuItem(
                                          value: 4,
                                          child: const Text('View'),
                                          onTap: () {},
                                        ),
                                        const PopupMenuItem(
                                            value: 5, child: Text('Delete'))
                                      ],
                                      onSelected: (value) async {
                                        if (value == 3) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EditLead(leadData: data),
                                            ),
                                          ).then((_) {
                                            setState(() {
                                              futureData = getLeadsData();
                                            });
                                          });
                                        }
                                        if (value == 4) {
                                          Navigator.pushNamed(context, '/view',
                                              arguments: data);
                                        }
                                        if (value == 5) {
                                          var res = await deleteLead(
                                            data.id,
                                          );
                                          log('res statusCode : ${res.statusCode} >>> body : ${res.body}');
                                          Navigator.pushReplacementNamed(
                                              context, '/allLeads');
                                          setState(() {
                                            futureData = getLeadsData();
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
