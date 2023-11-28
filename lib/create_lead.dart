import 'package:crm_new/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();

class CreateLead extends StatefulWidget {
  const CreateLead({super.key});

  @override
  State<CreateLead> createState() => _CreateLeadState();
}

class _CreateLeadState extends State<CreateLead> {
  String fullName = '';
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController contactType = TextEditingController();
  TextEditingController email = TextEditingController();

  String dropDownValue = 'USD';

  List<String> currencyy = [
    'USD',
    'PKR',
    'AED',
    'CAD',
    'GBP',
    'AUD',
    'INR',
    'CHF'
  ];

  List<String> countries = [
    'United States',
    'Pakistan',
    'Dubai',
    'Canada',
    'United Kingdom',
    'Australia',
    'India',
    'Switzerland'
  ];

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r"[a-zA-Z]+|\s");
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Create Lead'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(scrollbars: false),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25, child: Text('First Name*')),
                        TextFormField(
                          controller: firstName,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          validator: (name) => name!.length < 3
                              ? 'Name should be atleast 3 characters'
                              : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 15),
                        const SizedBox(height: 25, child: Text('Last Name')),
                        TextFormField(
                            controller: lastName,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder())),
                        const SizedBox(height: 15),
                        const SizedBox(height: 25, child: Text('Email*')),
                        TextFormField(
                          controller: email,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          validator: validateEmail,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 15),
                        const SizedBox(
                            height: 25, child: Text('Contact Type*')),
                        TextFormField(
                          controller: contactType,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          validator: (contactType) => contactType!.length < 3
                              ? 'Mention Contact Type'
                              : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 15),
                        const SizedBox(height: 25, child: Text('Language')),
                        TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder())),
                        const SizedBox(height: 15),
                        const SizedBox(height: 25, child: Text('Currency*')),
                        DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          hint:
                              const Text('USD', style: TextStyle(fontSize: 14)),
                          items: currencyy
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            dropDownValue = value.toString();
                          },
                          // onSaved: (value) {
                          //   dropDownValue = value.toString();
                          // },
                        ),
                        const SizedBox(height: 15),
                        const SizedBox(height: 25, child: Text('Group')),
                        TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder())),
                        const SizedBox(height: 15),
                        const SizedBox(height: 25, child: Text('Phone 1')),
                        const IntlPhoneField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder())),
                        const SizedBox(height: 15),
                        const SizedBox(height: 25, child: Text('Phone 2')),
                        const IntlPhoneField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder())),
                        const SizedBox(height: 15),
                        const SizedBox(height: 25, child: Text('Skype')),
                        TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder())),
                        const SizedBox(height: 15),
                        const SizedBox(height: 25, child: Text('Tax ID')),
                        TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder())),
                        const SizedBox(height: 15),
                        const SizedBox(height: 25, child: Text('Address')),
                        TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder())),
                        const SizedBox(height: 15),
                        const SizedBox(height: 25, child: Text('City')),
                        TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder())),
                        const SizedBox(height: 15),
                        const SizedBox(height: 25, child: Text('State/region')),
                        TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder())),
                        const SizedBox(height: 15),
                        const SizedBox(
                            height: 25, child: Text('Zip/postal code')),
                        TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder())),
                        const SizedBox(height: 15),
                        const SizedBox(height: 25, child: Text('Country')),
                        DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          hint: const Text('United States',
                              style: TextStyle(fontSize: 14)),
                          items: countries
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            dropDownValue = value.toString();
                          },
                          // onSaved: (value) {
                          //   dropDownValue = value.toString();
                          // },
                        ),
                        const SizedBox(height: 15),
                        const SizedBox(height: 25, child: Text('Thumbnail')),
                        TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder())),
                        const SizedBox(height: 20)
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 12, top: 15, bottom: 15),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          fullName = '${firstName.text}  ${lastName.text}';
                          context.read<UserProvider>().changeData(
                              newName: fullName,
                              newEmail: email.text,
                              newContactInfo: contactType.text,
                              newCurrency: dropDownValue);
                          Navigator.pushNamed(context, '/allLeads');
                          //_formKey.currentState!.validate();
                          //Navigator.pushNamed(context, '/allLeads');
                          // Navigator.of(context).push(MaterialPageRoute(
                          // builder: (context) => AllLeads(
                          // name: context.read<UserProvider>().changeData(
                          // newName: fullName,
                          // newEmail: email.text,
                          // newContactInfo: contactType.text,
                          // newCurrency: dropDownValue)
                          // )
                          // )
                          // );
                        },
                        child: const Text('Save',
                            style: TextStyle(color: Colors.white))),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
