// ignore_for_file: file_names, avoid_print
import 'package:crm_new/helpers/warehouseEditApi.dart';
import 'package:crm_new/models/warehouses_get_model.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class EditWarehouse extends StatefulWidget {
  final Data warehouseData; // Assuming 'Data' is your model class

  const EditWarehouse({Key? key, required this.warehouseData})
      : super(key: key);

  @override
  State<EditWarehouse> createState() => _EditWarehouseState();
}

class _EditWarehouseState extends State<EditWarehouse> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController editWarehouseController =
        TextEditingController(text: widget.warehouseData.name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Edit WareHouse',
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
                const SizedBox(height: 25, child: Text('Name')),
                TextFormField(
                  controller: editWarehouseController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Address')),
                TextFormField(
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
                            var res = await warehouseUpdateRequest(
                              widget.warehouseData.id,
                              editWarehouseController.text,
                            );
                            if (res.statusCode == 200) {
                              print('Warehouse Updated');
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
