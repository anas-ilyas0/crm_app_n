// ignore_for_file: file_names

import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class AddCategoryy extends StatefulWidget {
  const AddCategoryy({super.key});

  @override
  State<AddCategoryy> createState() => _AddCategoryyState();
}

class _AddCategoryyState extends State<AddCategoryy> {
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
          'Add Category',
          style: TextStyle(color: Colors.white),
        ),
        // bottom: const TabBar(
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Category*')),
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ('Please write a category');
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
    );
  }
}
