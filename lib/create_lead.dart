import 'dart:io';
import 'package:crm_new/all_registered_leads.dart';
import 'package:crm_new/providers/user_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();

class CreateLead extends StatefulWidget {
  const CreateLead({super.key});

  @override
  State<CreateLead> createState() => _CreateLeadState();
}

class _CreateLeadState extends State<CreateLead> {
  File? selectedImage;

  String fullName = '';
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController contactType = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController zip = TextEditingController();
  //copy controllers
  TextEditingController copyFirstName = TextEditingController();
  TextEditingController copyLastName = TextEditingController();
  TextEditingController copyAddress = TextEditingController();
  TextEditingController copyCity = TextEditingController();
  TextEditingController copyState = TextEditingController();
  TextEditingController copyZip = TextEditingController();

  int currentStep = 0;

  String currency = 'USD';
  String country = 'United States';
  String contactTypee = 'Lead';

  List<String> contactTypes = ['Lead 1', 'Lead 2', 'Lead 3'];

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

  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (returnedImage != null) {
        selectedImage = File(returnedImage.path);
      }
    });
  }

  List<Step> stepList() => [
        Step(
            isActive: currentStep >= 0,
            state: currentStep <= 0 ? StepState.editing : StepState.complete,
            title: const Text(''),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('First Name*')),
                TextFormField(
                  controller: firstName,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Please Enter Name');
                    }
                    return null;
                  },
                  // onChanged: (value) {
                  // dataProvider.name;
                  // },
                  // onSaved: (value) {
                  // dataProvider.name = value!;
                  // },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Last Name')),
                TextFormField(
                  controller: lastName,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Email')),
                TextFormField(
                  controller: email,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  // validator: (value) {
                  // if (value!.isEmpty ||
                  // !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                  // .hasMatch(value)) {
                  // return "Enter Correct Email";
                  // } else {
                  // return null;
                  // }
                  // },
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Address')),
                TextFormField(
                  controller: address,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Mention your address');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Contact Type')),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Choose contact type',
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                  items: contactTypes
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
                    contactTypee = value.toString();
                  },
                ),
              ],
            )),
        Step(
          isActive: currentStep >= 1,
          state: currentStep <= 1 ? StepState.editing : StepState.complete,
          title: const Text(''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Currency')),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                hint: const Text('USD', style: TextStyle(fontSize: 14)),
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
                  currency = value.toString();
                },
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Group')),
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Phone 1')),
              const IntlPhoneField(
                  decoration: InputDecoration(border: OutlineInputBorder())),
              const SizedBox(height: 7),
              const SizedBox(height: 25, child: Text('Phone 2')),
              const IntlPhoneField(
                  decoration: InputDecoration(border: OutlineInputBorder())),
              const SizedBox(height: 7),
              const SizedBox(height: 25, child: Text('Skype')),
              TextFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder())),
              const SizedBox(height: 15),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          state: currentStep <= 2 ? StepState.editing : StepState.complete,
          title: const Text(''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Tax ID')),
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Language')),
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('City')),
              TextFormField(
                controller: city,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('State/region')),
              TextFormField(
                controller: state,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Zip/postal code')),
              TextFormField(
                controller: zip,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 3,
          state: currentStep <= 3 ? StepState.editing : StepState.complete,
          title: const Text(''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
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
                    country = value.toString();
                  }),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Thumbnail')),
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
              const SizedBox(height: 15),
              const SizedBox(
                  height: 25,
                  child: Text(
                    'Delivery/shipping address',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  )),
              const SizedBox(height: 10),
              Container(
                  height: 25,
                  width: 105,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(5)),
                  child: Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: () {
                          copyFirstName.text = firstName.text;
                          copyLastName.text = lastName.text;
                          copyAddress.text = address.text;
                          copyCity.text = city.text;
                          copyState.text = state.text;
                          copyZip.text = zip.text;
                        },
                        child: const Text('Copy Address',
                            //textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white))),
                  )),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('First Name')),
              TextField(
                controller: copyFirstName,
                readOnly: true,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 4,
          state: currentStep <= 4 ? StepState.editing : StepState.complete,
          title: const Text(''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Last Name')),
              TextField(
                controller: copyLastName,
                readOnly: true,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Address')),
              TextField(
                controller: copyAddress,
                readOnly: true,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('City')),
              TextField(
                controller: copyCity,
                readOnly: true,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('State/region')),
              TextField(
                controller: copyState,
                readOnly: true,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 5,
          state: currentStep <= 5 ? StepState.editing : StepState.complete,
          title: const Text(''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Zip/postal code')),
              TextField(
                controller: copyZip,
                readOnly: true,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
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
                    country = value.toString();
                  }),
            ],
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Create Lead'),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Stepper(
              steps: stepList(),
              type: StepperType.horizontal,
              elevation: 0,
              currentStep: currentStep,
              onStepTapped: (step) {
                _formKey.currentState!.validate();
                setState(() {
                  currentStep = step;
                });
              },
              onStepContinue: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    String fullName = '${firstName.text}  ${lastName.text}';
                    dataProvider.changeData(
                      newName: fullName,
                      newEmail: email.text,
                      newAddress: address.text,
                      newContactType: contactTypee,
                    );
                    currentStep += 1;
                    if (currentStep == 6 && selectedImage != null) {
                      //Navigator.pushNamed(context, '/allLeads');
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return AllLeads(image: selectedImage!);
                      }));
                    }
                  });
                } else {
                  setState(() {
                    // return null;
                  });
                }
              },
              onStepCancel: () {
                if (currentStep > 0) {
                  setState(() {
                    currentStep -= 1;
                  });
                }
              },
            ),
          ),
        ));
  }
}
