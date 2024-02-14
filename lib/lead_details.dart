// ignore_for_file: avoid_print
import 'package:crm_new/models/leadsModel.dart';
import 'package:flutter/material.dart';

class LeadDetails extends StatefulWidget {
  const LeadDetails({Key? key}) : super(key: key);

  @override
  State<LeadDetails> createState() => _LeadDetailsState();
}

class _LeadDetailsState extends State<LeadDetails> {
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments
        as Data; // Ensure correct type casting
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FD),
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
          'Lead Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white.withOpacity(0.8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                LeadDetailsClass(
                  title: 'First Name',
                  value: data.firstName,
                ),
                LeadDetailsClass(
                  title: 'Last Name',
                  value: data.lastName,
                ),
                LeadDetailsClass(
                  title: 'Email',
                  value: data.email,
                ),
                LeadDetailsClass(
                  title: 'Address',
                  value: data.fulladdress,
                ),
                LeadDetailsClass(
                  title: 'Contact Type',
                  value: data.typeContact,
                ),
                LeadDetailsClass(
                  title: 'Company',
                  value: data.companyId.toString(),
                ),
                LeadDetailsClass(
                  title: 'Group',
                  value: data.groupId.toString(),
                ),
                LeadDetailsClass(
                  title: 'Phone 1',
                  value: data.phone1.toString(),
                ),
                LeadDetailsClass(
                  title: 'Phone 2',
                  value: data.phone2.toString(),
                ),
                LeadDetailsClass(
                  title: 'Skype',
                  value: data.skype,
                ),
                LeadDetailsClass(
                  title: 'City',
                  value: data.city,
                ),
                LeadDetailsClass(
                  title: 'State/region',
                  value: data.stateRegion,
                ),
                LeadDetailsClass(
                  title: 'Zip/postal Code',
                  value: data.zipPostalCode,
                ),
                LeadDetailsClass(
                  title: 'Tax ID',
                  value: data.taxId.toString(),
                ),
                LeadDetailsClass(
                  title: 'Country',
                  value: data.countryId.toString(),
                ),
                LeadDetailsClass(
                  title: 'Currency',
                  value: data.currencyId.toString(),
                ),
                LeadDetailsClass(
                  title: 'Language',
                  value: data.languageId.toString(),
                ),
                LeadDetailsClass(
                  title: 'Thumbnail',
                  value: data.thumbnail,
                ),
                const LeadDetailsClass(
                  title: 'Delivery/shipping Address',
                  //value: '${data.deliveryAddress}',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LeadDetailsClass extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;

  const LeadDetailsClass({
    Key? key,
    required this.title,
    this.value = '',
    this.titleStyle,
    this.valueStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: titleStyle ??
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: valueStyle ?? const TextStyle(fontSize: 15),
          )
        ],
      ),
      const Divider(color: Colors.black, thickness: 0.5),
      const SizedBox(height: 10),
    ]);
  }
}
