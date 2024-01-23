// ignore_for_file: use_build_context_synchronously, avoid_print
import 'dart:developer';
import 'package:crm_new/helpers/businessEditApi.dart';
import 'package:crm_new/models/business_get_model.dart';
import 'package:flutter/material.dart';

class EditBusinessList extends StatefulWidget {
  final Data businessData; // Assuming 'Data' is your model class

  const EditBusinessList({Key? key, required this.businessData})
      : super(key: key);

  @override
  State<EditBusinessList> createState() => _EditBusinessListState();
}

class _EditBusinessListState extends State<EditBusinessList> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController editNameController =
        TextEditingController(text: widget.businessData.businessName);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Edit Business Name',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25, child: Text('Business Name')),
            TextFormField(
              controller: editNameController,
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () async {
                  print(
                      'businessData.id : ${widget.businessData.id}  >>> editNameController.text : ${editNameController.text}');
                  var res = await updateBusiness(
                      widget.businessData.id, editNameController.text);

                  log('res statusCode : ${res.statusCode} >>> body : ${res.body}');

                  Navigator.pop(context);
                },
                child: const Text(
                  'Update',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
