import 'package:crm_new/home.dart';
import 'package:flutter/material.dart';

class ContactManagement extends StatelessWidget {
  const ContactManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Contacts Management',
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
                    image: 'images/contacts.png',
                    firstText: 'Contacts',
                    secondText: ''),
                GridTileofApp(
                    image: 'images/emailCompaigns.png',
                    firstText: 'Mailchimp',
                    secondText: 'email compaigns'),
              ]),
        ),
      ),
    );
  }
}
