// ignore_for_file: file_names
import 'dart:io';
import 'package:crm_new/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

final _formKey = GlobalKey<FormState>();

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File? selectedImage1;
  File? selectedImage2;
  File? selectedImage3;

  Future pickImageFromGallery1() async {
    final returnedImage1 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (returnedImage1 != null) {
        selectedImage1 = File(returnedImage1.path);
      }
    });
  }

  Future pickImageFromGallery2() async {
    final returnedImage2 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (returnedImage2 != null) {
        selectedImage2 = File(returnedImage2.path);
      }
    });
  }

  Future pickImageFromGallery3() async {
    final returnedImage3 =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (returnedImage3 != null) {
        selectedImage3 = File(returnedImage3.path);
      }
    });
  }

  bool showServiceType = true;
  bool showProductType = false;
  String addon = '';
  List<String> addons = [
    'Accounting module',
    'Essentials module',
    'Product catalogue module',
    'WooCommerce module',
    'Purchases module',
    'Stock transfers module',
    'Stock adjustment module',
    'Expenses module',
    'Tables module',
    'Modifiers module',
    'Service staff module',
    'Enable bookings module'
  ];
  String addonType = '';
  List<String> addonTypes = [
    'Accounting module',
    'Essentials module',
    'Product catalogue module',
    'WooCommerce module',
    'Purchases module',
    'Stock transfers module',
    'Stock adjustment module',
    'Expenses module',
    'Tables module',
    'Modifiers module',
    'Service staff module',
    'Enable bookings module'
  ];
  String productType = '';
  List<String> productTypes = ['Packages', 'Addon'];
  String businessList = '';
  List<String> businessLists = [''];
  String serviceType = '';
  List<String> serviceTypes = ['Digital Products', 'Physical Products'];
  String category = '';
  List<String> categories = [
    'Accessories',
    'Furniture',
    'Fashion',
    'TV & Appliances',
    'Home',
    'Sports',
    'Books',
    'Health & Nutrition',
    'Kitchen',
    'Tableware',
    'Cleaning Supplies',
    'Furnishing',
    'Lightening',
    'Gaming',
    'Grocery',
    'Jewellery',
    'Music',
    'Fitness',
  ];
  String priceInterval = '';
  List<String> priceIntervals = ['Days', 'Months', 'Years'];
  String warehouse = '';
  List<String> warehouses = [
    'London Warehouse',
    'Sydney Warehouse',
    'Mexico Warehouse',
    'Canada Warehouse'
  ];
  String status = '';
  List<String> statuses = ['Active', 'Inactive', 'Damaged'];
  String brand = '';
  List<String> brands = [
    'Apple',
    'Samsung',
    'Vivo',
    'LG',
    'Reebook',
    'MRF',
    'Redmi',
    'Lenin',
    'Adidas',
    'Tommy Hilfiger',
    'Moto',
    'Nike',
    'Prestige',
    'Puma'
  ];
  String tax = '';
  List<String> taxes = [''];
  String discount = '';
  List<String> discounts = [''];
  int currentStep = 0;

  List<Step> stepList() => [
        Step(
            isActive: currentStep >= 0,
            state: currentStep <= 0 ? StepState.indexed : StepState.complete,
            title: const Text(''),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25, child: Text('Service type')),
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  hint: const Text('Please select',
                      style: TextStyle(fontSize: 14)),
                  items: serviceTypes
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
                    setState(() {
                      serviceType = value.toString();
                      showServiceType = serviceType == 'Physical Products';
                    });
                  },
                ),
                const SizedBox(height: 20),
                if (showServiceType)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25, child: Text('Product name*')),
                      TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ('Write a product name');
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction),
                      const SizedBox(height: 20),
                      const SizedBox(height: 25, child: Text('Product code')),
                      TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder())),
                      const SizedBox(height: 20),
                      const SizedBox(height: 25, child: Text('Status')),
                      DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          hint: const Text('Choose a status',
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
                          }),
                      const SizedBox(height: 20),
                      const SizedBox(height: 25, child: Text('Actual price*')),
                      TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ('Please write an actual price');
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction),
                    ],
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25, child: Text('Product type')),
                      DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          hint: const Text('Choose a status',
                              style: TextStyle(fontSize: 14)),
                          items: productTypes
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
                            setState(() {
                              productType = value.toString();
                              showProductType = productType == 'Addon';
                            });
                          }),
                      const SizedBox(height: 20),
                      const SizedBox(height: 25, child: Text('Product name*')),
                      TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return ('Write a product name');
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction),
                      const SizedBox(height: 20),
                      if (showProductType)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                                height: 25, child: Text('Addon Type')),
                            DropdownButtonFormField2<String>(
                                isExpanded: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                hint: const Text('Please select',
                                    style: TextStyle(fontSize: 14)),
                                items: addonTypes
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
                                  addonType = value.toString();
                                }),
                            const SizedBox(height: 20),
                            const SizedBox(
                                height: 25, child: Text('Actual Price*')),
                            TextFormField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return ('Write an actual price');
                                  }
                                  return null;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction),
                          ],
                        )
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25, child: Text('Addon')),
                            DropdownButtonFormField2<String>(
                                isExpanded: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                hint: const Text('Please select',
                                    style: TextStyle(fontSize: 14)),
                                items: addons
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
                                  addon = value.toString();
                                }),
                            const SizedBox(height: 20),
                            const SizedBox(
                                height: 25, child: Text('Actual price*')),
                            TextFormField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder()),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return ('Write an actual price');
                                  }
                                  return null;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction),
                          ],
                        )
                    ],
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
              if (showServiceType)
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const SizedBox(height: 25, child: Text('Sale price')),
                  TextFormField(
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 25, child: Text('Stock quantity')),
                  TextFormField(
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 25, child: Text('Alert quantity')),
                  TextFormField(
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 25, child: Text('Warehouse')),
                  DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      hint: const Text('Please select',
                          style: TextStyle(fontSize: 14)),
                      items: warehouses
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
                        warehouse = value.toString();
                      }),
                  const SizedBox(height: 20),
                  const SizedBox(height: 25, child: Text('Category')),
                  DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      hint: const Text('Please select',
                          style: TextStyle(fontSize: 14)),
                      items: categories
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
                        category = value.toString();
                      }),
                ])
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25, child: Text('Sale price')),
                    TextFormField(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 25, child: Text('Product code')),
                    TextFormField(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 25, child: Text('Status')),
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
                        }),
                    if (!showProductType)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const SizedBox(
                              height: 25, child: Text('No of active users')),
                          TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(
                              height: 25, child: Text('No of products')),
                          TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                          ),
                        ],
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const SizedBox(height: 25, child: Text('Tax')),
                          DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              hint: const Text('Please Select',
                                  style: TextStyle(fontSize: 14)),
                              items: taxes
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
                                tax = value.toString();
                              }),
                          const SizedBox(height: 20),
                          const SizedBox(height: 25, child: Text('Discount')),
                          DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              hint: const Text('Please Select',
                                  style: TextStyle(fontSize: 14)),
                              items: discounts
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
                                discount = value.toString();
                              }),
                        ],
                      )
                  ],
                )
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
                if (showServiceType)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25, child: Text('Brand')),
                      DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          hint: const Text('Please select',
                              style: TextStyle(fontSize: 14)),
                          items: brands
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
                            brand = value.toString();
                          }),
                      const SizedBox(height: 20),
                      const SizedBox(height: 25, child: Text('Tax')),
                      DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          hint: const Text('Please Select',
                              style: TextStyle(fontSize: 14)),
                          items: taxes
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
                            tax = value.toString();
                          }),
                      const SizedBox(height: 20),
                      const SizedBox(height: 25, child: Text('Discount')),
                      DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          hint: const Text('Please Select',
                              style: TextStyle(fontSize: 14)),
                          items: discounts
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
                            discount = value.toString();
                          }),
                      const SizedBox(height: 20),
                      const SizedBox(height: 25, child: Text('Mix discount')),
                      TextFormField(
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(
                          height: 25, child: Text('Related Business List')),
                      DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          hint: const Text('Please Select',
                              style: TextStyle(fontSize: 14)),
                          items: businessLists
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
                            businessList = value.toString();
                          }),
                    ],
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!showProductType)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                                height: 25, child: Text('No of invoices')),
                            TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(height: 20),
                            const SizedBox(
                                height: 25, child: Text('Price interval')),
                            DropdownButtonFormField2<String>(
                                isExpanded: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                hint: const Text('Please select',
                                    style: TextStyle(fontSize: 14)),
                                items: priceIntervals
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
                                  priceInterval = value.toString();
                                }),
                            const SizedBox(height: 20),
                            const SizedBox(height: 25, child: Text('Interval')),
                            TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(height: 20),
                            const SizedBox(
                                height: 25, child: Text('Trial days')),
                            TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(height: 20),
                            const SizedBox(height: 25, child: Text('Tax')),
                            DropdownButtonFormField2<String>(
                                isExpanded: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                hint: const Text('Please select',
                                    style: TextStyle(fontSize: 14)),
                                items: taxes
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
                                  tax = value.toString();
                                }),
                          ],
                        )
                      else
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (showProductType)
                              const SizedBox(
                                  height: 25, child: Text('Mix discount')),
                            TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(height: 20),
                            const SizedBox(height: 25, child: Text('Excerpt')),
                            TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(height: 20),
                            const SizedBox(
                                height: 25,
                                child: Text('Related Business List')),
                            DropdownButtonFormField2<String>(
                                isExpanded: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                hint: const Text('Please Select',
                                    style: TextStyle(fontSize: 14)),
                                items: businessLists
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
                                  businessList = value.toString();
                                }),
                            const SizedBox(height: 20),
                            const SizedBox(
                                height: 25, child: Text('Product size')),
                            TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(height: 20),
                            const SizedBox(
                                height: 25, child: Text('Product weight')),
                            TextFormField(
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder()),
                            ),
                          ],
                        ),
                    ],
                  )
              ],
            )),
        Step(
          isActive: currentStep >= 3,
          state: currentStep <= 3 ? StepState.indexed : StepState.complete,
          title: const Text(''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showServiceType)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25, child: Text('Product size')),
                    TextFormField(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 25, child: Text('Product weight')),
                    TextFormField(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 25, child: Text('HSN/SAC code')),
                    TextFormField(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 25, child: Text('Excerpt')),
                    TextFormField(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 25, child: Text('Image gallery')),
                    TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: GestureDetector(
                            onTap: () {
                              pickImageFromGallery1();
                            },
                            child: selectedImage1 != null
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
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: Image.file(selectedImage1!,
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
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!showProductType)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25, child: Text('Discount')),
                          DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              hint: const Text('Please Select',
                                  style: TextStyle(fontSize: 14)),
                              items: discounts
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
                                discount = value.toString();
                              }),
                          const SizedBox(height: 20),
                          const SizedBox(
                              height: 25, child: Text('Mix discount')),
                          TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(height: 25, child: Text('Excerpt')),
                          TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(
                              height: 25, child: Text('Related Business List')),
                          DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              hint: const Text('Please Select',
                                  style: TextStyle(fontSize: 14)),
                              items: businessLists
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
                                businessList = value.toString();
                              }),
                          const SizedBox(height: 20),
                          const SizedBox(
                              height: 25, child: Text('Product size')),
                          TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                          ),
                        ],
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                              height: 25, child: Text('HSN/SAC code')),
                          TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(
                              height: 25, child: Text('Image gallery')),
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    pickImageFromGallery1();
                                  },
                                  child: selectedImage1 != null
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
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: Image.file(selectedImage1!,
                                                  fit: BoxFit.fill),
                                            ),
                                          )
                                        ])
                                      : const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('No File Choosen',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                        ),
                                ),
                              ),
                            ),
                          ),
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
                                    pickImageFromGallery2();
                                  },
                                  child: selectedImage2 != null
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
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: Image.file(selectedImage2!,
                                                  fit: BoxFit.fill),
                                            ),
                                          )
                                        ])
                                      : const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('No File Choosen',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(
                              height: 25, child: Text('Other files')),
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    pickImageFromGallery3();
                                  },
                                  child: selectedImage3 != null
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
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: Image.file(selectedImage3!,
                                                  fit: BoxFit.fill),
                                            ),
                                          )
                                        ])
                                      : const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('No File Choosen',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                  ],
                )
            ],
          ),
        ),
        Step(
          isActive: currentStep >= 4,
          state: currentStep <= 4 ? StepState.indexed : StepState.complete,
          title: const Text(''),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (showServiceType)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 25, child: Text('Thumbnail')),
                    TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: GestureDetector(
                            onTap: () {
                              pickImageFromGallery2();
                            },
                            child: selectedImage2 != null
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
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: Image.file(selectedImage2!,
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
                    const SizedBox(height: 20),
                    const SizedBox(height: 25, child: Text('Other files')),
                    TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: GestureDetector(
                            onTap: () {
                              pickImageFromGallery3();
                            },
                            child: selectedImage3 != null
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
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: Image.file(selectedImage3!,
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
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!showProductType)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                              height: 25, child: Text('Product weight')),
                          TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(
                              height: 25, child: Text('HSN/SAC code')),
                          TextFormField(
                            decoration: const InputDecoration(
                                border: OutlineInputBorder()),
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(
                              height: 25, child: Text('Image gallery')),
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    pickImageFromGallery1();
                                  },
                                  child: selectedImage1 != null
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
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: Image.file(selectedImage1!,
                                                  fit: BoxFit.fill),
                                            ),
                                          )
                                        ])
                                      : const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('No File Choosen',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                        ),
                                ),
                              ),
                            ),
                          ),
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
                                    pickImageFromGallery2();
                                  },
                                  child: selectedImage2 != null
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
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: Image.file(selectedImage2!,
                                                  fit: BoxFit.fill),
                                            ),
                                          )
                                        ])
                                      : const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('No File Choosen',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                        ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const SizedBox(
                              height: 25, child: Text('Other files')),
                          TextField(
                            readOnly: true,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    pickImageFromGallery3();
                                  },
                                  child: selectedImage3 != null
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
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: Image.file(selectedImage3!,
                                                  fit: BoxFit.fill),
                                            ),
                                          )
                                        ])
                                      : const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text('No File Choosen',
                                              style: TextStyle(
                                                  color: Colors.grey)),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    else
                      const Column()
                  ],
                )
            ],
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Add Product'),
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
                            currentStep == 4 ? 'Save' : 'Next',
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
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    currentStep = step;
                  });
                } else {
                  Utils.showSnackbar(context, 'Please filled required fields');
                }
              },
              onStepContinue: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    currentStep += 1;
                  });
                } else {
                  Utils.showSnackbar(context, 'Please filled required fields');
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
