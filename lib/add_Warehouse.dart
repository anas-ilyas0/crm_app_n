// ignore_for_file: file_names, avoid_print
import 'package:crm_new/helpers/warehousePostApi.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class AddWarehouse extends StatefulWidget {
  const AddWarehouse({super.key});

  @override
  State<AddWarehouse> createState() => _AddWarehouseState();
}

class _AddWarehouseState extends State<AddWarehouse> {
  TextEditingController warehouseController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Add Warehouse',
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
                const SizedBox(height: 15),
                const SizedBox(height: 25, child: Text('Name*')),
                TextFormField(
                  controller: warehouseController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Write your warehouse name');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Address')),
                TextFormField(
                  controller: addressController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Description')),
                TextFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 25),
                Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var res = await warehousePostRequest(
                                warehouseController.text,
                                addressController.text);
                            if (res.statusCode == 200) {
                              print('Warehouse Registered');
                              if (!mounted) return;
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(
                                  context, '/warehouses');
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
