import 'package:crm_new/home.dart';
import 'package:flutter/material.dart';

class ContentManagement extends StatefulWidget {
  const ContentManagement({super.key});

  @override
  State<ContentManagement> createState() => _ContentManagementState();
}

class _ContentManagementState extends State<ContentManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Content Management',
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
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/categories');
                  },
                  child: const GridTileofApp(
                      image: 'images/categories.png',
                      firstText: 'Categories',
                      secondText: ''),
                ),
                const GridTileofApp(
                    image: 'images/tags.png',
                    firstText: 'Tags',
                    secondText: ''),
                const GridTileofApp(
                    image: 'images/pages.png',
                    firstText: 'Pages',
                    secondText: ''),
                const GridTileofApp(
                    image: 'images/articles.png',
                    firstText: 'Articles',
                    secondText: ''),
              ]),
        ),
      ),
    );
  }
}
