// ignore_for_file: file_names, // ignore_for_file: avoid_unnecessary_containers, avoid_print, use_build_context_synchronously
import 'dart:io';
import 'package:crm_new/leads.dart';
import 'package:crm_new/helpers/leadEditApi.dart';
import 'package:crm_new/models/leadsModel.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

final _formKey = GlobalKey<FormState>();

class EditLead extends StatefulWidget {
  final Data leadData;
  const EditLead({Key? key, required this.leadData}) : super(key: key);

  @override
  State<EditLead> createState() => _EditLeadState();
}

class _EditLeadState extends State<EditLead> {
  File? selectedImage;
  late TextEditingController editFirstName;
  late TextEditingController editLastName;
  late TextEditingController editCompanyName;
  late TextEditingController editEmail;
  late TextEditingController editAddress;
  late TextEditingController editGroup;
  late TextEditingController editSkype;
  late TextEditingController editTaxID;
  late TextEditingController editCurrencyController;
  late TextEditingController editLanguage;
  late TextEditingController editContactType;
  late TextEditingController editCity;
  late TextEditingController editState;
  late TextEditingController editZip;
  late TextEditingController editPhone1;
  late TextEditingController editPhone2;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with values from widget.leadData
    editFirstName = TextEditingController(text: widget.leadData.firstName);
    editLastName = TextEditingController(text: widget.leadData.lastName);
    editCompanyName =
        TextEditingController(text: widget.leadData.companyId.toString());
    editEmail = TextEditingController(text: widget.leadData.email);
    editAddress = TextEditingController(text: widget.leadData.fulladdress);
    //editCompany =
    TextEditingController(text: widget.leadData.companyId.toString());
    editGroup = TextEditingController(text: widget.leadData.groupId.toString());
    editSkype = TextEditingController(text: widget.leadData.skype);
    editTaxID = TextEditingController(text: widget.leadData.taxId.toString());
    editCurrencyController =
        TextEditingController(text: widget.leadData.currencyId.toString());
    editLanguage =
        TextEditingController(text: widget.leadData.languageId.toString());
    editContactType = TextEditingController(text: widget.leadData.typeContact);
    editCity = TextEditingController(text: widget.leadData.city);
    editState = TextEditingController(text: widget.leadData.stateRegion);
    editZip =
        TextEditingController(text: widget.leadData.zipPostalCode.toString());
    editPhone1 = TextEditingController(text: widget.leadData.phone1.toString());
    editPhone2 = TextEditingController(text: widget.leadData.phone2.toString());
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed from the widget tree
    editFirstName.dispose();
    editLastName.dispose();
    editEmail.dispose();
    editAddress.dispose();
    editCompanyName.dispose();
    editGroup.dispose();
    editSkype.dispose();
    editTaxID.dispose();
    editCurrencyController.dispose();
    editLanguage.dispose();
    editContactType.dispose();
    editCity.dispose();
    editState.dispose();
    editZip.dispose();
    editPhone1.dispose();
    editPhone2.dispose();
    super.dispose();
  }

  //copy controllers
  // TextEditingController copyFirstName = TextEditingController();
  // TextEditingController copyLastName = TextEditingController();
  // TextEditingController copyAddress = TextEditingController();
  // TextEditingController copyCity = TextEditingController();
  // TextEditingController copyState = TextEditingController();
  // TextEditingController copyZip = TextEditingController();

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
            state: currentStep <= 0 ? StepState.indexed : StepState.complete,
            title: const Text(''),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25, child: Text('First Name*')),
                TextFormField(
                  controller: editFirstName,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Please enter your name');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Last Name')),
                TextFormField(
                  controller: editLastName,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Company Name*')),
                TextFormField(
                  controller: editCompanyName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Please enter your compamy name');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Email')),
                TextFormField(
                  controller: editEmail,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                            .hasMatch(value)) {
                      return "Enter valid email";
                    } else {
                      return null;
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Address')),
                TextFormField(
                  controller: editAddress,
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
              ],
            )),
        Step(
          isActive: currentStep >= 1,
          state: currentStep <= 1 ? StepState.indexed : StepState.complete,
          title: const Text(''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  //contactType.text = contactTypee;
                },
              ),
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
              const SizedBox(height: 25, child: Text('Phone 1')),
              IntlPhoneField(
                  controller: editPhone1,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder())),
              const SizedBox(height: 25, child: Text('Phone 2')),
              IntlPhoneField(
                  controller: editPhone2,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder())),
              const SizedBox(height: 25, child: Text('Skype')),
              TextFormField(
                  controller: editSkype,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder())),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          state: currentStep <= 2 ? StepState.indexed : StepState.complete,
          title: const Text(''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25, child: Text('Language')),
              TextFormField(
                controller: editLanguage,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Group')),
              TextFormField(
                controller: editGroup,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Tax ID')),
              TextFormField(
                controller: editTaxID,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('City')),
              TextFormField(
                controller: editCity,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('State/region')),
              TextFormField(
                controller: editState,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 3,
          state: currentStep <= 3 ? StepState.indexed : StepState.complete,
          title: const Text(''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25, child: Text('Zip/postal code')),
              TextFormField(
                controller: editZip,
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
                          // copyFirstName.text = firstName.text;
                          // copyLastName.text = lastName.text;
                          // copyAddress.text = address.text;
                          // copyCity.text = city.text;
                          // copyState.text = state.text;
                          // copyZip.text = zip.text;
                        },
                        child: const Text('Copy Address',
                            //textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white))),
                  )),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('First Name')),
              const TextField(
                //controller: copyFirstName,
                readOnly: true,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 4,
          state: currentStep <= 4 ? StepState.indexed : StepState.complete,
          title: const Text(''),
          content: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25, child: Text('Last Name')),
              TextField(
                //controller: copyLastName,
                readOnly: true,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              SizedBox(height: 25, child: Text('Address')),
              TextField(
                //controller: copyAddress,
                readOnly: true,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              SizedBox(height: 25, child: Text('City')),
              TextField(
                //controller: copyCity,
                readOnly: true,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              SizedBox(height: 25, child: Text('State/region')),
              TextField(
                //controller: copyState,
                readOnly: true,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              SizedBox(height: 25, child: Text('Zip/postal code')),
              TextField(
                //controller: copyZip,
                readOnly: true,
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
            ],
          ),
        ),
        Step(
            title: const Text(''),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
            ))
      ];

  @override
  Widget build(BuildContext context) {
    //var dataProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Edit Lead'),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Stepper(
              connectorColor: const MaterialStatePropertyAll(Colors.indigo),
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (currentStep != 0)
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo),
                            onPressed: details.onStepCancel,
                            child: const Text(
                              'Previous',
                              style: TextStyle(color: Colors.white),
                            )),
                      const SizedBox(width: 12),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo),
                          onPressed: details.onStepContinue,
                          child: Text(
                            currentStep == 5 ? 'Update' : 'Next',
                            style: const TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                );
              },
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
              onStepContinue: () async {
                if (_formKey.currentState!.validate()) {
                  if (currentStep < stepList().length - 1) {
                    setState(() {
                      currentStep += 1;
                    });
                  } else {
                    //String fullName = '${firstName.text} ${lastName.text}';
                    try {
                      var res = await updateLead(
                          widget.leadData.id,
                          editFirstName.text,
                          editLastName.text,
                          editCompanyName.text.toString(),
                          editEmail.text,
                          editAddress.text,
                          editGroup.text.toString(),
                          editSkype.text.toString(),
                          editTaxID.text.toString(),
                          editCurrencyController.text.toString(),
                          editLanguage.text.toString(),
                          editContactType.text.toString(),
                          editCity.text.toString(),
                          editState.text.toString(),
                          editZip.text.toString(),
                          editPhone1.text.toString(),
                          editPhone2.text.toString());
                      if (res.statusCode == 200) {
                        print('Lead Updated');
                        if (!mounted) return;
                        Navigator.pop(context);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const AllLeads();
                        }));
                      } else {
                        print(
                            'Something went wrong: ${res.statusCode}, ${res.reasonPhrase}');
                      }
                    } catch (e) {
                      print('Exception caught: $e');
                    }
                  }
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
