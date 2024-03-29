// ignore_for_file: file_names, avoid_print, unused_local_variable
import 'package:crm_new/helpers/brandPostApi.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class AddBrand extends StatefulWidget {
  const AddBrand({super.key});

  @override
  State<AddBrand> createState() => _AddBrandState();
}

class _AddBrandState extends State<AddBrand> {
  TextEditingController titleController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  String status = '';
  List<String> statuses = ['Active', 'Inactive'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Add Brand',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                const SizedBox(height: 25, child: Text('Title*')),
                TextFormField(
                  controller: titleController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Enter your brand title');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Status')),
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
                      statusController.text = status;
                    }),
                const SizedBox(height: 25),
                Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var res = await brandPostRequest(
                                titleController.text, statusController.text);
                            if (res.statusCode == 200) {
                              print('Brand Registered');
                              if (!mounted) return;
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(
                                  context, '/brands');
                            } else {
                              print('Something went wrong : ${res.statusCode}');
                            }
                          }
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
