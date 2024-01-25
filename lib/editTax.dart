// ignore_for_file: file_names, avoid_print
import 'package:crm_new/helpers/taxEditApi.dart';
import 'package:crm_new/models/tax_get_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class EditTax extends StatefulWidget {
  final Data taxesData; // Assuming 'Data' is your model class

  const EditTax({Key? key, required this.taxesData}) : super(key: key);

  @override
  State<EditTax> createState() => _EditTaxState();
}

class _EditTaxState extends State<EditTax> {
  String rateType = '';
  List<String> rateTypes = ['Value', 'Percent'];
  @override
  Widget build(BuildContext context) {
    TextEditingController editTaxController =
        TextEditingController(text: widget.taxesData.name);
    TextEditingController editRateController =
        TextEditingController(text: widget.taxesData.rate.toString());
    TextEditingController editRateTypeController =
        TextEditingController(text: widget.taxesData.rateType);
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
          'Edit Tax',
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
                const SizedBox(height: 25, child: Text('Name*')),
                TextFormField(
                  controller: editTaxController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Write a name');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Rate*')),
                TextFormField(
                  controller: editRateController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Please enter rate');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Rate type')),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: Text(editRateTypeController.text,
                      style: const TextStyle(fontSize: 14)),
                  items: rateTypes
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
                    rateType = value.toString();
                    editRateTypeController.text = rateType;
                  },
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Description')),
                TextFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(height: 25),
                Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var res = await updateTax(
                                widget.taxesData.id,
                                editTaxController.text,
                                editRateController.text,
                                editRateTypeController.text);
                            if (res.statusCode == 200) {
                              print('Tax Updated');
                              if (!mounted) return;
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(context, '/taxes');
                            } else {
                              print('Something went wrong : ${res.statusCode}');
                            }
                          }
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
