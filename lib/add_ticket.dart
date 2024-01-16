// ignore_for_file: file_names

import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final _formKey = GlobalKey<FormState>();

class AddTicket extends StatefulWidget {
  const AddTicket({super.key});

  @override
  State<AddTicket> createState() => _AddTicketState();
}

class _AddTicketState extends State<AddTicket> {
  String status = '';
  List<String> statuses = ['Development', 'Testing'];
  String category = '';
  List<String> categories = ['Development', 'Testing'];
  String priority = '';
  List<String> priorities = ['High', 'Medium', 'Low', 'Urgent'];
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
          'Add Ticket',
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
                const SizedBox(height: 15),
                const SizedBox(height: 25, child: Text('Subject*')),
                TextFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Write a subject');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Status*')),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Please select');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Priority*')),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Please select',
                      style: TextStyle(fontSize: 14)),
                  items: priorities
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
                    priority = value.toString();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Please select');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Category*')),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Please select',
                      style: TextStyle(fontSize: 14)),
                  items: categories
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
                    category = value.toString();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Please select');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Other files')),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: () {
                          pickImageFromGallery();
                        },
                        child: selectedImage != null
                            ? Row(children: [
                                const Text(
                                  'Choose File',
                                ),
                                const SizedBox(width: 140),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    width: 70,
                                    height: 100,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: Image.file(selectedImage!,
                                        fit: BoxFit.fill),
                                  ),
                                )
                              ])
                            : const Align(
                                alignment: Alignment.centerLeft,
                                child: Text('No File Choosen',
                                    style: TextStyle(color: Colors.grey)),
                              ),
                      ),
                    ),
                  ),
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
