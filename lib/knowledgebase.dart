import 'package:crm_new/home.dart';
import 'package:flutter/material.dart';

class Knowledgebase extends StatefulWidget {
  const Knowledgebase({super.key});

  @override
  State<Knowledgebase> createState() => _KnowledgebaseState();
}

class _KnowledgebaseState extends State<Knowledgebase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Knowledgebase',
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
          padding: const EdgeInsets.only(top: 25),
          child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1.4),
              children: const [
                GridTileofApp(
                    image: 'images/support.png',
                    firstText: 'Support',
                    secondText: ''),
                GridTileofApp(
                    image: 'images/faqs.png',
                    firstText: 'FAQs',
                    secondText: ''),
                GridTileofApp(
                    image: 'images/categories.png',
                    firstText: 'Categories',
                    secondText: ''),
              ]),
        ),
      ),
    );
  }
}
