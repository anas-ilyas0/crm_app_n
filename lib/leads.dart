// ignore_for_file: avoid_print, use_build_context_synchronously
// ignore: must_be_immutable
import 'dart:convert';
import 'dart:developer';
import 'package:crm_new/editLead.dart';
import 'package:crm_new/helpers/leadDeleteApi.dart';
import 'package:crm_new/models/leadsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Data>> getLeadsData() async {
  var headers = {
    'Accept': 'application/json',
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTc5MDIxYTVkNzVjNjRlN2JkMWEzMDFiNWFhNDM4NmE5ZDg2ODhiYWIzOGNlMGJlZjc1ZThmYzc4NTk3NDUxMmY2NzU5ZDYzYTQyMjhiZTEiLCJpYXQiOjE3MDQ2MzE3NTQuNzA3NDQyMDQ1MjExNzkxOTkyMTg3NSwibmJmIjoxNzA0NjMxNzU0LjcwNzQ0NDkwNjIzNDc0MTIxMDkzNzUsImV4cCI6MTczNjI1NDE1NC4wOTY0OTMwMDU3NTI1NjM0NzY1NjI1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.ohcBGh5fmRjTjPHUCXdjsMZIH8rZE0iqMGh7n6PnLS3mk-cPbs63U6JR6pM6poKcvMyuxa-v9QXUXpUx_0rkD_NRM2CPkkvG5tg3XdH9rGjdB122TDXMECThlPMUNTv7mDUfnixfIMVN97udEbeVQX4HC1ty5UFuIlw-OBOzTOHw23-XddaS6ymx6ieDAwZjm1BsW3HpabTL3ZKXBfdB4_XbfmB15LYEDxa-Kj8_2B9Fo9PR6_6FGjzfCGrRdK6nyvof6ITWep74d5MOSg-ZGBlt31gGd8MQEVQGhaIUI1RXVD5BpMckQ9OTNCTdKn-lu1xmqphsbGonmT88pIHts0J1Ugm5MDmhkHB2IPKHxtpnQN50qAQg-7xBOmhyfeUKUhStHGtVnKTcVHGMtrZL_F-ARCDUkkhoVwNj6q483tt66EJqDdF_EOU0dNvBOGG-BtpPEwsMymPUyegljY4Oh4malvl7zFzHZ1U2sBnyCPuRDsXLxr1CGOrFiEl_hIjzO2QXWHZZgIzUnMKOPP4yUzIOFOpFiHyZuhz_Fz1AH6fuSDvGb04MqXAwZPyhULVSH1g31UKQ4Sv3U2RK-Z5MX-6VzsQ-y3dZkd4saw7e9C_0DWKhCPs_TWBvsuWShqT5vNQ05GBRU7WibBsn0whcHJMzzAdpPP5gMUC712FwvLs'
  };
  var url = Uri.parse('https://testcrm.thesuperstarshop.com/api/v1/leads');

  try {
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      LeadsModel leadsData = LeadsModel.fromJson(jsonResponse);
      print('Successfully Fetched Data');
      return leadsData.data;
    } else {
      print('Error: ${response.reasonPhrase}');
      return [];
    }
  } catch (e) {
    print('Exception occurred: $e');
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
              //ListView.builder(
              //future: futureData,
              //itemBuilder: (context, snapshot) {
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return const Expanded(
              //     child: Center(
              //       child: CircularProgressIndicator(
              //         color: Colors.blue,
              //       ),
              //     ),
              //   );
              // } else if (snapshot.hasError) {
              //   return Expanded(
              //     child: Center(child: Text('Error: ${snapshot.error}')),
              //   );
              // } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              //   return const Expanded(
              //     child: Center(child: Text('No data available.')),
              //   );
              // }
              Expanded(
                  child: SingleChildScrollView(
                child: Center(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(columns: const [
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Contact Type')),
                        DataColumn(label: Text('Email')),
                        DataColumn(label: Text('Address')),
                        DataColumn(label: Text('Actions')),
                      ], rows: [
                        // snapshot.data!
                        //     .map((data) =>
                        DataRow(cells: [
                          const DataCell(Text('Umar'
                              //data.name
                              )),
                          const DataCell(Text('Lead'
                              //data.typeContact
                              )),
                          const DataCell(Text('umar@gmail.com'
                              //data.email
                              )),
                          const DataCell(Text('USA'
                              //data.fulladdress
                              )),
                          DataCell(Center(
                            child: PopupMenuButton(
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                    value: 1, child: Text('Create Proposal')),
                                const PopupMenuItem(
                                    value: 2, child: Text('Send Email')),
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
            ])));
    //));
    //   );
    // },
    //     ),
    //   ]),
    // ));
  }
}//
