import 'package:crm_new/home.dart';
import 'package:flutter/material.dart';

class ViewLead extends StatelessWidget {
  const ViewLead({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
            'View Lead',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.3,
              ),
              children: const [
                GridTileofApp(
                  image: 'images/details.png',
                  firstText: 'Details',
                  secondText: '',
                ),
                GridTileofApp(
                    image: 'images/contactV.png',
                    firstText: 'Contact',
                    secondText: 'Notes'),
                GridTileofApp(
                    image: 'images/contactDoc.png',
                    firstText: 'Contact',
                    secondText: 'Documents'),
                GridTileofApp(
                    image: 'images/proposal.png',
                    firstText: 'Proposals',
                    secondText: ''),
              ],
            ),
          ),
        ));
  }
}
