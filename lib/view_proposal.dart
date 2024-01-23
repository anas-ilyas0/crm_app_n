// ignore_for_file: avoid_print, use_build_context_synchronously, prefer_typing_uninitialized_variables

//import 'dart:convert';
import 'dart:io';
//import 'dart:ui' as ui;
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

class ViewProposal extends StatefulWidget {
  const ViewProposal({super.key});

  @override
  State<ViewProposal> createState() => _ViewProposalState();
}

class _ViewProposalState extends State<ViewProposal> {
  late var data;
  late var bytes;
  String? base64Image;
  bool showSignature = false;
  String drawSignaturePath = '';
  FocusNode myfocus = FocusNode();
  //File? _selectedLogo;
  File? _selectedSignature;
  // Color buttonColor = const Color.fromRGBO(28, 12, 91, 1);

  // void _handleClearButtonPressed() {
  //   signatureGlobalKey.currentState!.clear();
  //   Navigator.of(context).pop();
  // }

  // void _handleSaveButtonPressed() async {
  //   data = await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
  //   print('data signature >>> $data');
  //   bytes = await data.toByteData(format: ui.ImageByteFormat.png);
  //   print('data bytes >>> $bytes');
  //   base64Image = base64Encode(bytes!.buffer.asUint8List());

  //   setState(() {
  //     showSignature = true;
  //     drawSignaturePath = 'data:image/png;base64,$base64Image';
  //   });

  //   if (base64Image != null) {
  //     Navigator.of(context).pop();
  //   }
  // }

  // void _openGalleryForLogo(BuildContext context) async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _selectedLogo = File(pickedFile!.path);
  //   });

  //   print('_selectedLogo >>> ${_selectedLogo!.path}');
  // }

  // void _openGalleryForSignature(BuildContext context) async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _selectedSignature = File(pickedFile!.path);
  //     showSignature = false;
  //   });
  //   print('_selectedSignature >>>> gallery $_selectedSignature');
  // }

  // void _showImagePickerBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //     builder: (BuildContext context) {
  //       return SafeArea(
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: <Widget>[
  //             ListTile(
  //               leading: const Icon(Icons.edit),
  //               title: const Text('Draw Signature'),
  //               onTap: () {
  //                 Navigator.pop(context);
  //                 signature();
  //               },
  //             ),
  //             ListTile(
  //               leading: const Icon(Icons.photo_library),
  //               title: const Text('Select from gallery'),
  //               onTap: () {
  //                 Navigator.pop(context);
  //                 _openGalleryForSignature(context);
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  // signature() {
  //   print('Im inside signature() >>>>>>>>>>>>> ');
  //   myfocus.unfocus();
  //   return showModalBottomSheet(
  //     enableDrag: false,
  //     backgroundColor: Colors.blue,
  //     context: context,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
  //     ),
  //     builder: (BuildContext _) {
  //       return Padding(
  //         padding: const EdgeInsets.all(15),
  //         child: Column(
  //           children: [
  //             const SizedBox(height: 20),
  //             const Text('Please draw Signature',
  //                 style: TextStyle(
  //                     fontSize: 16,
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.white)),
  //             const SizedBox(height: 20),
  //             Container(
  //               decoration: BoxDecoration(
  //                 border: Border.all(
  //                   color: Colors.white,
  //                   style: BorderStyle.solid,
  //                   width: 2,
  //                 ),
  //                 borderRadius: const BorderRadius.all(Radius.circular(30)),
  //               ),
  //               child: SfSignaturePad(
  //                   key: signatureGlobalKey,
  //                   strokeColor: Colors.white,
  //                   minimumStrokeWidth: 1.0,
  //                   maximumStrokeWidth: 4.0),
  //             ),
  //             const SizedBox(height: 20),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: [
  //                 ElevatedButton(
  //                     style: ElevatedButton.styleFrom(
  //                         backgroundColor: Colors.white),
  //                     onPressed: () => _handleClearButtonPressed(),
  //                     child: const Text(
  //                       'Cancel',
  //                       style: TextStyle(color: Colors.blue),
  //                     )),
  //                 ElevatedButton(
  //                     style: ElevatedButton.styleFrom(
  //                         backgroundColor: Colors.white),
  //                     onPressed: () => _handleSaveButtonPressed(),
  //                     child: const Text(
  //                       'Submit',
  //                       style: TextStyle(color: Colors.blue),
  //                     )),
  //               ],
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Proposal',
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
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Row(children: [
                      Text(
                        'Proposal: ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('#2024/00001')
                    ]),
                    const Row(
                      children: [
                        Text(
                          'Reference: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Ali Bhai'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(16.0),
                      child: const Text(
                        'DELIVERED',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Text(
                          'Recipient: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Blocks Pos Testing',
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          'ATTN: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Ronak Vyas')
                      ],
                    ),
                    const Text('10332 LAURIE LANE AUSTIN TX'),
                    const Row(
                      children: [
                        Text(
                          'Phone: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('5129217431')
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          'Email: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'ronak_T_vyas@outlook.com',
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          'Delivery/Ship to:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Text(
                        'Ronak Vyas 10332 LAURIE LANE AUSTIN TX \n8313 Southwest FWY#215, Houston, TX 77074'),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Proposal Date',
                            ),
                            initialValue: '01-10-2024',
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Proposal Expiry Date',
                            ),
                            initialValue: '02-09-2024',
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Sale Agent',
                      ),
                      initialValue: 'Umar Khalid',
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Total',
                      ),
                      initialValue: '\$150.00',
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Item name')),
                        DataColumn(label: Text('Qntys')),
                        DataColumn(label: Text('Rate')),
                        DataColumn(label: Text('Tax')),
                        DataColumn(label: Text('Tax(%)')),
                        DataColumn(label: Text('Discount')),
                        DataColumn(label: Text('Discount(%)')),
                        DataColumn(label: Text('Amount')),
                      ],
                      rows: List<DataRow>.generate(
                        1,
                        (index) {
                          return const DataRow(cells: [
                            DataCell(
                              Center(
                                child: Text('Account module'),
                              ),
                            ),
                            DataCell(
                              Center(
                                child: Text('1'),
                              ),
                            ),
                            DataCell(
                              Center(
                                child: Text('\$150'),
                              ),
                            ),
                            DataCell(
                              Center(
                                child: Text('\$0.00 %'),
                              ),
                            ),
                            DataCell(
                              Center(
                                child: Text('\$ 0 %'),
                              ),
                            ),
                            DataCell(
                              Center(
                                child: Text('\$ 0.00 %'),
                              ),
                            ),
                            DataCell(
                              Center(
                                child: Text('\$ 0 %'),
                              ),
                            ),
                            DataCell(
                              Center(
                                child: Text('\$150'),
                              ),
                            ),
                          ]);
                        },
                      )),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            'Summary',
                            style: Theme.of(context).textTheme.titleLarge,
                          )),
                      const ListTile(
                        title: Text(
                          'Total tax (+) :',
                        ),
                        trailing: Text('\$10'),
                      ),
                      const ListTile(
                        title: Text(
                          'Sub total :',
                        ),
                        trailing: Text('\$20'),
                      ),
                      const ListTile(
                        title: Text(
                          'Total discount (-) :',
                        ),
                        trailing: Text('\$30'),
                      ),
                      const ListTile(
                        title: Text(
                          'Grand total :',
                        ),
                        trailing: Text('\$40'),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Column(
                  children: [
                    Text('Authorized person'),
                    Text(
                      'Signature',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    Text('(Ronak Vyas)'),
                    Text('Business Owner'),
                  ],
                ),
                // Column(
                //   children: [
                //     const Text(
                //       'Logo',
                //       style:
                //           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //     ),
                //     const SizedBox(height: 10),
                //     InkWell(
                //       onTap: () => _openGalleryForLogo(context),
                //       child: Stack(
                //         children: [
                //           Container(
                //               width: 100,
                //               height: 100,
                //               decoration: BoxDecoration(
                //                   shape: BoxShape.circle,
                //                   border: Border.all(
                //                     width: 2,
                //                     style: BorderStyle.solid,
                //                     color: Colors.black,
                //                   ),
                //                   image: _selectedLogo != null
                //                       ? DecorationImage(
                //                           image: FileImage(_selectedLogo!),
                //                           fit: BoxFit.cover,
                //                         )
                //                       : const DecorationImage(
                //                           image: AssetImage(
                //                               'assets/images/default.png'),
                //                           fit: BoxFit.cover,
                //                         ))),
                //           Positioned(
                //             bottom: 0,
                //             right: 0,
                //             child: Container(
                //               width: 30,
                //               height: 30,
                //               decoration: const BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 color: Colors.black,
                //               ),
                //               child: const Icon(
                //                 Icons.photo_library,
                //                 color: Colors.white,
                //                 size: 18,
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                Column(
                  children: [
                    // const Text('Signature',
                    //     style: TextStyle(
                    //         fontSize: 18, fontWeight: FontWeight.bold)),
                    // const SizedBox(height: 10),
                    InkWell(
                      // onTap: () => _showImagePickerBottomSheet(context),
                      child: Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 2,
                                  style: BorderStyle.solid,
                                  color: Colors.black,
                                ),
                                image: (_selectedSignature != null &&
                                        showSignature == false)
                                    ? DecorationImage(
                                        image: FileImage(_selectedSignature!),
                                        fit: BoxFit.cover,
                                      )
                                    : const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/default.png'),
                                        fit: BoxFit.cover,
                                      )),
                            child: showSignature
                                ? Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.memory(
                                        bytes!.buffer.asUint8List(),
                                        color: Colors.black),
                                  )
                                : const SizedBox(),
                          ),
                          // Positioned(
                          //   bottom: 0,
                          //   right: 0,
                          //   child: Container(
                          //     width: 30,
                          //     height: 30,
                          //     decoration: const BoxDecoration(
                          //       shape: BoxShape.circle,
                          //       color: Colors.black,
                          //     ),
                          //     child: const Icon(
                          //       Icons.edit,
                          //       color: Colors.white,
                          //       size: 18,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(height: 20)
          ],
        ),
      ),
    );
  }
}
