// ignore_for_file: file_names, avoid_print

import 'dart:io';
import 'package:crm_new/helpers/categoriesEditApi.dart';
import 'package:crm_new/models/categories_get_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

final _formKey = GlobalKey<FormState>();

class EditCategory extends StatefulWidget {
  final Data categoryData; // Assuming 'Data' is your model class

  const EditCategory({Key? key, required this.categoryData}) : super(key: key);
  //const EditCategory({super.key});

  @override
  State<EditCategory> createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
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
    final TextEditingController editCategoryController =
        TextEditingController(text: widget.categoryData.name);
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
          'Edit Category',
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
                const SizedBox(height: 25, child: Text('Category*')),
                TextFormField(
                  controller: editCategoryController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Write a category name');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Description')),
                TextFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Photo')),
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
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            //var res =
                            await updateCategory(widget.categoryData.id,
                                editCategoryController.text);
                            //if (res.statusCode == 201) {
                            print('Category Registered');
                            if (!mounted) return;
                            Navigator.pop(context);
                            Navigator.pushReplacementNamed(
                                context, '/categories');
                            // } else {
                            //   print('Something went wrong : ${res.statusCode}');
                            // }
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
