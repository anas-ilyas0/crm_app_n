// ignore_for_file: file_names

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class PlaceNewOrder extends StatefulWidget {
  const PlaceNewOrder({super.key});

  @override
  State<PlaceNewOrder> createState() => _PlaceNewOrderState();
}

class _PlaceNewOrderState extends State<PlaceNewOrder> {
  String customer = '';
  List<String> customers = ['Israel Bosco', 'Grover Emmerich', 'Carlo Conroy'];
  String currency = '';
  List<String> currencies = [''];
  String condition = '';
  List<String> conditions = ['Yes', 'No'];
  String status = '';
  List<String> statuses = ['Active', 'Pending'];
  String billingCycle = '';
  List<String> billingCycles = ['One time', 'Day', 'Week', 'Month', 'Year'];
  String recurringType = '';
  List<String> recurringTypes = ['Day(s)', 'Week(s)', 'Month(s)', 'Year(s)'];
  int currentStep = 0;
  List<Step> stepList() => [
        Step(
            isActive: currentStep >= 0,
            state: currentStep <= 0 ? StepState.editing : StepState.complete,
            title: const Text(''),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25, child: Text('Customer*')),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Please select',
                      style: TextStyle(fontSize: 14)),
                  items: customers
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
                    customer = value.toString();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Please select one customer');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Currency*')),
                AbsorbPointer(
                  absorbing: true,
                  child: DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    hint: const Text('Please select',
                        style: TextStyle(fontSize: 14)),
                    items: currencies
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
                    // validator: (value) {
                    // if (value == null || value.isEmpty) {
                    // return ('Please select currency type');
                    // }
                    // return null;
                    // },
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Status*')),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Please select',
                      style: TextStyle(fontSize: 14)),
                  items: statuses
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
                    status = value.toString();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ('Choose a status');
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Billing Cycle')),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Please select',
                      style: TextStyle(fontSize: 14)),
                  items: billingCycles
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
                    billingCycle = value.toString();
                  },
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 25, child: Text('Update Stock')),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Please select',
                      style: TextStyle(fontSize: 14)),
                  items: conditions
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
                    condition = value.toString();
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
              const SizedBox(height: 25, child: Text('Is Recurring')),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                hint:
                    const Text('Please select', style: TextStyle(fontSize: 14)),
                items: conditions
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
                  condition = value.toString();
                },
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Recurring Type*')),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                hint:
                    const Text('Please select', style: TextStyle(fontSize: 14)),
                items: recurringTypes
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
                  recurringType = value.toString();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ('Please select');
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Recurring Value*')),
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ('Enter a recurring value');
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Total Cycles')),
              TextFormField(
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                  height: 25,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                        'Prevent Sending Overdue Remainders for this Order*'),
                  )),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                hint:
                    const Text('Please select', style: TextStyle(fontSize: 14)),
                items: conditions
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
                  condition = value.toString();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ('Please select');
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Item name')),
                      DataColumn(
                          label: Padding(
                        padding: EdgeInsets.only(left: 47),
                        child: Text('Quantity'),
                      )),
                      DataColumn(
                          label: Padding(
                        padding: EdgeInsets.only(left: 17),
                        child: Text('Rate'),
                      )),
                      DataColumn(label: Text('Tax(%)')),
                      DataColumn(label: Text('Tax')),
                      DataColumn(label: Text('Discount(%)')),
                      DataColumn(label: Text('Discount')),
                      DataColumn(label: Text('Amount')),
                      DataColumn(label: Text('Action')),
                    ],
                    rows: List<DataRow>.generate(
                      8,
                      (index) {
                        return DataRow(cells: [
                          const DataCell(
                            Center(
                              child: Text('Item Name'),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.remove_circle),
                                      iconSize: 17),
                                  const Text('Quantity'),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add_circle),
                                      iconSize: 17),
                                ],
                              ),
                            ),
                          ),
                          const DataCell(
                            Center(
                              child: Text('Developer'),
                            ),
                          ),
                          const DataCell(
                            Center(
                              child: Text('Ali'),
                            ),
                          ),
                          const DataCell(
                            Center(
                              child: Text('25'),
                            ),
                          ),
                          const DataCell(
                            Center(
                              child: Text('25'),
                            ),
                          ),
                          const DataCell(
                            Center(
                              child: Text('25'),
                            ),
                          ),
                          const DataCell(
                            Center(
                              child: Text('25'),
                            ),
                          ),
                          DataCell(
                            Center(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete)),
                            ),
                          ),
                        ]);
                      },
                    )),
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
              const SizedBox(
                  height: 25, child: Text('Enter Product Information')),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Enter product description',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 30),
              Container(
                height: 280,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        'Total Bill',
                        style: Theme.of(context).textTheme.titleLarge,
                      )),
                  // ListTile(
                  // title: const Text('Total  Salesman Commission'),
                  // trailing: const Text('10'),
                  // onTap: () {},
                  // ),
                  ListTile(
                    title: const Text('Total tax'),
                    trailing: const Text('20'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Sub total'),
                    trailing: const Text('30'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Total discount'),
                    trailing: const Text('40'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Grand total'),
                    trailing: const Text('50'),
                    onTap: () {},
                  ),
                ]),
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
              const SizedBox(height: 25, child: Text('Generate Invoice')),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                hint:
                    const Text('Please select', style: TextStyle(fontSize: 14)),
                items: conditions
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
                  condition = value.toString();
                },
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Send Email')),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                hint:
                    const Text('Please select', style: TextStyle(fontSize: 14)),
                items: conditions
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
                  condition = value.toString();
                },
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Send SMS')),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                hint:
                    const Text('Please select', style: TextStyle(fontSize: 14)),
                items: conditions
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
                  condition = value.toString();
                },
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 25, child: Text('Add Payment to Income')),
              DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                hint:
                    const Text('Please select', style: TextStyle(fontSize: 14)),
                items: conditions
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
                  condition = value.toString();
                },
              ),
            ],
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Place New Order',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
          child: Form(
              key: _formKey,
              child: Stepper(
                connectorColor: const MaterialStatePropertyAll(Colors.indigo),
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  return Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Column(
                      children: [
                        Row(
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
                                child: Text(currentStep == 4 ? 'Save' : 'Next',
                                    style:
                                        const TextStyle(color: Colors.white))),
                          ],
                        ),
                        // if (currentStep == 5)
                        // ElevatedButton(
                        // style: ElevatedButton.styleFrom(
                        // backgroundColor: Colors.indigo,
                        // ),
                        // onPressed: () {},
                        // child: const Text(
                        // 'Save & Send',
                        // style: TextStyle(color: Colors.white),
                        // ),
                        // ),
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
                onStepContinue: () {
                  if (_formKey.currentState!.validate()) {
                    currentStep += 1;
                    setState(() {
                      //String fullName = '${firstName.text}  ${lastName.text}
                      if (currentStep == 6) {
                        // dataProvider.changeData(
                        // newName: fullName,
                        // newEmail: email.text,
                        // newAddress: address.text,
                        // newContactType: contactTypee,
                        // newImage: selectedImage,
                        // );
                        // Navigator.pushReplacement(context,
                        // MaterialPageRoute(builder: (BuildContext context) {
                        // return const AllLeads();
                        // }));
                      }
                    });
                  } else {
                    setState(() {});
                  }
                },
                onStepCancel: () {
                  if (currentStep > 0) {
                    setState(() {
                      currentStep -= 1;
                    });
                  }
                },
              ))),
    );
  }
}
