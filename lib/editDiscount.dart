// ignore_for_file: file_names, avoid_print
import 'package:crm_new/helpers/discountEditApi.dart';
import 'package:crm_new/models/discounts_get_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class EditDiscount extends StatefulWidget {
  final Data discountsData; // Assuming 'Data' is your model class

  const EditDiscount({Key? key, required this.discountsData}) : super(key: key);

  @override
  State<EditDiscount> createState() => _EditDiscountState();
}

class _EditDiscountState extends State<EditDiscount> {
  String discountType = '';
  List<String> discountTypes = ['Value', 'Percent'];
  @override
  Widget build(BuildContext context) {
    TextEditingController editDiscountNameController =
        TextEditingController(text: widget.discountsData.name);
    TextEditingController editDiscountController =
        TextEditingController(text: widget.discountsData.discount.toString());
    TextEditingController editDiscountTypeController =
        TextEditingController(text: widget.discountsData.discountType);
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
          'Edit Discount',
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
                  controller: editDiscountNameController,
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
                const SizedBox(height: 25, child: Text('Discount*')),
                TextFormField(
                  controller: editDiscountController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Please enter discount');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Discount type')),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: Text(editDiscountTypeController.text,
                      style: const TextStyle(fontSize: 14)),
                  items: discountTypes
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
                    discountType = value.toString();
                    editDiscountTypeController.text = discountType;
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
                            var res = await updateDiscount(
                                widget.discountsData.id,
                                editDiscountNameController.text,
                                editDiscountController.text,
                                editDiscountTypeController.text);
                            if (res.statusCode == 200) {
                              print('Discount Updated');
                              if (!mounted) return;
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(
                                  context, '/discounts');
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
