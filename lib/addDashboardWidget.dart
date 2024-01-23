// ignore_for_file: file_names

import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final _formKey = GlobalKey<FormState>();

class AddDashboardWidget extends StatefulWidget {
  const AddDashboardWidget({super.key});

  @override
  State<AddDashboardWidget> createState() => _AddDashboardWidgetState();
}

class _AddDashboardWidgetState extends State<AddDashboardWidget> {
  String status = '';
  List<String> statuses = ['Active', 'Inactive'];
  String type = '';
  List<String> types = [
    'Numbers',
    'Chart',
    'List',
    'View',
  ];
  String column = '';
  List<String> columns = [
    '1',
    '2',
    '3',
    '4',
  ];
  File? selectedImage;
  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (returnedImage != null) {
        selectedImage = File(returnedImage.path);
      }
    });
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
          'Add Dashboard Widget',
          style: TextStyle(color: Colors.white),
        ),
        // bottom: const TabBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Title*')),
                TextFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Write a title');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Slug')),
                TextFormField(
                    decoration:
                        const InputDecoration(border: OutlineInputBorder())),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Status')),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Please select',
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
                  },
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Type')),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Please select',
                      style: TextStyle(fontSize: 14)),
                  items: types
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
                    type = value.toString();
                  },
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Columns')),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Please select',
                      style: TextStyle(fontSize: 14)),
                  items: columns
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
                    column = value.toString();
                  },
                ),
                const SizedBox(height: 25),
                Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
