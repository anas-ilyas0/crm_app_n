// import 'package:crm_new/models/expansion_tilesmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'dart:convert';

// Future<List<CountryItem>> loadJsonData() async {
//   final String response =
//       await rootBundle.loadString('assets/countries_json/countries.json');
//   final data = json.decode(response);
//   List<CountryItem> items =
//       (data['data'] as List).map((i) => CountryItem.fromJson(i)).toList();
//   return items;
// }

// class ExpansionTiles extends StatefulWidget {
//   const ExpansionTiles({super.key});

//   @override
//   State<ExpansionTiles> createState() => _ExpansionTilesState();
// }

// class _ExpansionTilesState extends State<ExpansionTiles> {
//   late Future<List<CountryItem>> items;

//   @override
//   void initState() {
//     super.initState();
//     items = loadJsonData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<CountryItem>>(
//         future: items,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 var item = snapshot.data![index];
//                 return ExpansionTile(
//                   title: Text(item.name),
//                   children: <Widget>[
//                     ListTile(title: Text(item.field1)),
//                     ListTile(title: Text(item.field2)),
//                     ListTile(title: Text(item.field3)),
//                   ],
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Text("${snapshot.error}");
//           }
//           return CircularProgressIndicator(
//             color: Colors.blue,
//           );
//         },
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<dynamic>> loadJsonData() async {
  final String jsonURL = 'assets/countries_json/countries.json';
  final String response = await rootBundle.loadString(jsonURL);
  final data = jsonDecode(response);
  return data['data'];
}

class ExpansionTiles extends StatefulWidget {
  const ExpansionTiles({Key? key}) : super(key: key);

  @override
  State<ExpansionTiles> createState() => _ExpansionTilesState();
}

class _ExpansionTilesState extends State<ExpansionTiles> {
  late Future<List<dynamic>> items;

  @override
  void initState() {
    super.initState();
    items = loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text('Expansion Tiles'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: items,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var item = snapshot.data![index];
                return ExpansionTile(
                  title: Text(item['name']),
                  children: <Widget>[
                    ListTile(title: Text(item['field1'])),
                    ListTile(title: Text(item['field2'])),
                    ListTile(title: Text(item['field3'])),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}
