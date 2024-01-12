// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AddTag extends StatefulWidget {
  const AddTag({super.key});

  @override
  State<AddTag> createState() => _AddTagState();
}

class _AddTagState extends State<AddTag> {
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
          'Add Tag',
          style: TextStyle(color: Colors.white),
        ),
        // bottom: const TabBar(
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const SizedBox(height: 25, child: Text('Tag')),
            TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 25, child: Text('Slug')),
            TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 25),
            Center(
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {},
                    child: const Text(
                      'Save',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }
}
