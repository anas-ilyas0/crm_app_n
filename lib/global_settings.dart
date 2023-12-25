import 'package:crm_new/home.dart';
import 'package:flutter/material.dart';

class GlobalSettings extends StatefulWidget {
  const GlobalSettings({super.key});

  @override
  State<GlobalSettings> createState() => _GlobalSettingsState();
}

class _GlobalSettingsState extends State<GlobalSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Global Settings',
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
                    image: 'images/dashboardWidgets.png',
                    firstText: 'Dashboard',
                    secondText: 'Widgets'),
                GridTileofApp(
                    image: 'images/dynamicOptions.png',
                    firstText: 'Dynamic',
                    secondText: 'Options'),
                GridTileofApp(
                    image: 'images/currencies.png',
                    firstText: 'Currencies',
                    secondText: ''),
                GridTileofApp(
                    image: 'images/emailTemplates.png',
                    firstText: 'Email',
                    secondText: 'Templates'),
                GridTileofApp(
                    image: 'images/paymentGateway.png',
                    firstText: 'Payment',
                    secondText: 'Gateways'),
                GridTileofApp(
                    image: 'images/taxes.png',
                    firstText: 'Taxes',
                    secondText: ''),
                GridTileofApp(
                    image: 'images/discount.png',
                    firstText: 'Discounts',
                    secondText: ''),
                GridTileofApp(
                    image: 'images/translations.png',
                    firstText: 'Translations',
                    secondText: ''),
                GridTileofApp(
                    image: 'images/languages.png',
                    firstText: 'Languages',
                    secondText: ''),
                GridTileofApp(
                    image: 'images/databaseBackup.png',
                    firstText: 'Database',
                    secondText: 'Backup'),
                GridTileofApp(
                    image: 'images/themes.png',
                    firstText: 'Site',
                    secondText: 'Themes'),
                GridTileofApp(
                    image: 'images/settings.png',
                    firstText: 'Master',
                    secondText: 'Settings'),
              ]),
        ),
      ),
    );
  }
}
