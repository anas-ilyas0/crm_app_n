// ignore_for_file: file_names, avoid_print, use_build_context_synchronously
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:crm_new/helpers/brandPostApi.dart';
import 'package:crm_new/helpers/sql_helper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class SQLOfflineData extends StatefulWidget {
  const SQLOfflineData({super.key});

  @override
  State<SQLOfflineData> createState() => _SQLOfflineDataState();
}

class _SQLOfflineDataState extends State<SQLOfflineData> {
  List<Map<String, dynamic>> journals = [];
  bool isLoading = true;
  void refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      journals = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    refreshJournals();
    print('No of Items ${journals.length}');
    initConnectivity();
    Connectivity().onConnectivityChanged.listen(updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    updateConnectionStatus(connectivityResult);
  }

  void updateConnectionStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile) {
      // Network is available, sync data
      syncDataWithServer();
    }
  }

  void syncDataWithServer() async {
    List<Map<String, dynamic>> unsyncedItems =
        await SQLHelper.getUnsyncedItems();
    for (var item in unsyncedItems) {
      var response = await brandPostRequest(item['title'], item['description']);
      if (response.statusCode == 200) {
        await SQLHelper.markAsSynced(item['id']);
      }
    }
  }

  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  String status = '';
  List<String> statuses = ['Active', 'Inactive'];

  Future<void> addItem() async {
    await SQLHelper.createItem(title.text, description.text);
    refreshJournals();
  }

  Future<void> updateItem(int id) async {
    await SQLHelper.updateItem(id, title.text, description.text);
    refreshJournals();
  }

  void deleteItem(int id) async {
    await SQLHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        content: Text('Successfully Deleted'),
      ),
    );
    refreshJournals();
  }

  void showForm(int? id) async {
    if (id != null) {
      final existingJournal =
          journals.firstWhere((element) => element['id'] == id);
      title.text = existingJournal['title'];
      description.text = existingJournal['description'];
    }
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 120),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: title,
                    decoration: const InputDecoration(hintText: 'Title'),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      hint: const Text('Choose a status',
                          style: TextStyle(fontSize: 14)),
                      items: statuses
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {
                        status = value.toString();
                        description.text = status;
                      }),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: () async {
                        if (id == null) {
                          await addItem();
                        }
                        if (id != null) {
                          await updateItem(id);
                        }
                        title.clear();
                        description.clear();
                        Navigator.pop(context);
                      },
                      child: Text(
                        id == null ? 'Create New' : 'Update',
                        style: const TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'SQF Lite Offline Data',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: ListView.builder(
          itemCount: journals.length,
          itemBuilder: (context, index) => Card(
                color: Colors.orange[300],
                margin: const EdgeInsets.all(15),
                child: ListTile(
                  title: Text(journals[index]['title']),
                  subtitle: Text(journals[index]['description']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            showForm(journals[index]['id']);
                          },
                          icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            deleteItem(journals[index]['id']);
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  ),
                ),
              )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          showForm(null);
        },
      ),
    );
  }
}
