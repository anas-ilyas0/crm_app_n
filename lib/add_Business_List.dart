// ignore_for_file: file_names, avoid_print, use_build_context_synchronously
import 'package:crm_new/helpers/businessPostApi.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class AddBusinessList extends StatefulWidget {
  const AddBusinessList({super.key});

  @override
  State<AddBusinessList> createState() => _AddBusinessListState();
}

class _AddBusinessListState extends State<AddBusinessList> {
  TextEditingController businessName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Add New Business',
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
                const SizedBox(height: 25, child: Text('Business Name*')),
                TextFormField(
                  controller: businessName,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Enter your business name');
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var res = await sendPostRequest(businessName.text);
                            if (res.statusCode == 200) {
                              print('Business Registered');
                              if (!mounted) return;
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(
                                  context, '/businessList');
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
