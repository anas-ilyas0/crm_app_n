// ignore_for_file: file_names, avoid_print, unused_local_variable
import 'package:flutter/material.dart';
import 'package:crm_new/helpers/brandEditApi.dart';
import 'package:crm_new/models/brands_get_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

final _formKey = GlobalKey<FormState>();

class EditBrand extends StatefulWidget {
  final Data brandData; // Assuming 'Data' is your model class

  const EditBrand({Key? key, required this.brandData}) : super(key: key);

  @override
  State<EditBrand> createState() => _EditBrandState();
}

class _EditBrandState extends State<EditBrand> {
  String status = '';
  List<String> statuses = ['Active', 'Inactive'];

  @override
  Widget build(BuildContext context) {
    final TextEditingController editTitleController =
        TextEditingController(text: widget.brandData.title);
    final TextEditingController editStatusController =
        TextEditingController(text: widget.brandData.status);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Edit Brand',
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
                const SizedBox(height: 25, child: Text('Title')),
                TextFormField(
                  controller: editTitleController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Status')),
                DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    hint: Text(editStatusController.text,
                        style: const TextStyle(fontSize: 14)),
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
                      editStatusController.text = value.toString();
                    }),
                const SizedBox(height: 25),
                Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () async {
                          //if (editTitleController.text.isNotEmpty) {
                          var res = await updateBrand(
                              widget.brandData.id,
                              editTitleController.text,
                              editStatusController.text);
                          if (res.statusCode == 200) {
                            print('Brand Updated');
                            if (!mounted) return;
                            Navigator.pop(context);
                            Navigator.pushReplacementNamed(context, '/brands');
                          } else {
                            print('Something went wrong : ${res.statusCode}');
                          }
                          //}
                        },
                        child: const Text(
                          'Update',
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
