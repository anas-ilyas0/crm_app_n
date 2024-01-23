// ignore_for_file: file_names
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class AddLanguage extends StatefulWidget {
  const AddLanguage({super.key});

  @override
  State<AddLanguage> createState() => _AddLanguageState();
}

class _AddLanguageState extends State<AddLanguage> {
  String condition = '';
  List<String> conditions = ['Yes', 'No'];
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
          'Add Language',
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
                const SizedBox(height: 25, child: Text('Language*')),
                TextFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Enter a language name');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Code*')),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Write a code');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Is rtl*')),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Please select',
                      style: TextStyle(fontSize: 14)),
                  items: conditions
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
                    condition = value.toString();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Please select');
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
      ),
    );
  }
}
