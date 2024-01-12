// // ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

// import 'package:admin_app/helpers/const.dart';
// import 'package:admin_app/ui/screens/kitchen/kitchen_dashboard.dart';
// import 'package:admin_app/ui/screens/kitchen/kitchen_widgets.dart';
// import 'package:admin_app/ui/screens/kitchen/qsr/qsr_dashboard.dart';
// import 'package:admin_app/ui/widgets/widget.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'dart:math' as math;

// class AddFoodItemScreen extends StatefulWidget {
//   static const routeName = '/AddFoodItemScreen';
//   const AddFoodItemScreen({Key? key}) : super(key: key);

//   @override
//   State<AddFoodItemScreen> createState() => _AddFoodItemScreenState();
// }

// class _AddFoodItemScreenState extends State<AddFoodItemScreen> {
//   String productType = "";
//   List<String> productTypes = ["Single", "Combo"];
//   int? location;
//   bool isActive = true;
//   bool onlineItems = false;
//   String? selectedValue;
//   bool showSearchIngredients = false;
//   bool showsingle = false;
//   TextEditingController quantityController = TextEditingController(text: '1');
//   @override
//   void initState() {
//     super.initState();
//     // Set the default value for the dropdown
//     selectedValue = "Combo";

//     // Set the initial visibility based on the default value
//     showSearchIngredients = selectedValue == "Combo";
//     showsingle = selectedValue == 'Single';
//   }

//   bool POS = false;
//   var width;
//   Widget textFieldWidget(
//       {hint, controller, lable, type, input, icon, padding, suffixIcon}) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: SizedBox(
//         width: width * 0.48,
//         child: TextFormField(
//           keyboardType: type,
//           inputFormatters: input,
//           textInputAction: TextInputAction.next,
//           controller: controller,
//           decoration: InputDecoration(
//             suffixIcon: suffixIcon,
//             floatingLabelBehavior: FloatingLabelBehavior.always,
//             hintText: hint,
//             labelText: lable,
//             prefixIcon: icon,
//             contentPadding: padding,
//             //  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     width = MediaQuery.of(context).size.width;
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: const SystemUiOverlayStyle(
//         statusBarColor: buttonColor,
//         statusBarIconBrightness: Brightness.light,
//       ),
//       child: SafeArea(
//         child: Scaffold(
//           appBar: actionAppBar(context, 'Add Food Items',
//               action: Padding(
//                 padding: const EdgeInsets.only(
//                   right: 10,
//                   top: 10,
//                 ),
//                 child: Center(
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pushReplacementNamed(
//                           context, KitchenDashboard.routeName);
//                     },
//                     child: Container(
//                       color: Colors.white,
//                       height: 40,
//                       width: 60,
//                       child: const Center(
//                         child: Text(
//                           "Submit",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               color: buttonColor,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               )),
//           body: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     textFieldWidget(hint: 'Item Name', lable: 'Item Name'),
//                     textFieldWidget(
//                         hint: 'Prep Timing',
//                         lable: 'Prep Timing',
//                         type: TextInputType.number,
//                         input: [
//                           FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
//                         ]),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     textFieldWidget(
//                         hint: 'Search Department',
//                         lable: 'Search Department',
//                         suffixIcon: Icon(Icons.arrow_drop_down)),
//                     textFieldWidget(
//                         hint: 'Sub Department', lable: 'Sub Department'),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     textFieldWidget(
//                       hint: 'Description',
//                       lable: 'Description',
//                     ),
//                     const SizedBox(
//                       width: 30,
//                     ),
//                     Checkbox(
//                       value: isActive,
//                       onChanged: (value) {
//                         setState(
//                           () {
//                             isActive = value!;
//                           },
//                         );
//                       },
//                     ),
//                     Text(
//                       'is active',
//                       style: GoogleFonts.getFont(
//                         'Poppins',
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 40,
//                     ),
//                     Checkbox(
//                       value: onlineItems,
//                       onChanged: (value) {
//                         setState(
//                           () {
//                             onlineItems = value!;
//                           },
//                         );
//                       },
//                     ),
//                     Text(
//                       'online items',
//                       style: GoogleFonts.getFont(
//                         'Poppins',
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 40,
//                     ),
//                     Checkbox(
//                       value: POS,
//                       onChanged: (value) {
//                         setState(
//                           () {
//                             POS = value!;
//                           },
//                         );
//                       },
//                     ),
//                     Text(
//                       'POS shortcut',
//                       style: GoogleFonts.getFont(
//                         'Poppins',
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Divider(
//                   height: 5,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: DropdownButtonFormField2<String>(
//                             isExpanded: true,
//                             decoration: const InputDecoration(
//                               labelText: "Select Type",
//                               border: OutlineInputBorder(),
//                             ),
//                             // lable:
//                             //     const Text('', style: TextStyle(fontSize: 14)),
//                             value:
//                                 selectedValue, // Set the default selected value here
//                             items: productTypes
//                                 .map((item) => DropdownMenuItem<String>(
//                                       value: item,
//                                       child: Text(
//                                         item,
//                                         style: const TextStyle(
//                                           fontSize: 14,
//                                         ),
//                                       ),
//                                     ))
//                                 .toList(),
//                             onChanged: (String? value) {
//                               setState(() {
//                                 selectedValue = value;
//                                 showSearchIngredients = value == "Combo";
//                                 showsingle = value == 'Single';
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: showSearchIngredients
//                             ? Padding(
//                                 padding: const EdgeInsets.all(18),
//                                 child: DropdownSearch<String>(
//                                   popupProps: const PopupProps.dialog(
//                                     showSelectedItems: true,
//                                     showSearchBox: true,
//                                   ),
//                                   items: itemIngredients
//                                       .map((ingredient) =>
//                                           ingredient['ingredientsName']!)
//                                       .toList(),
//                                   dropdownDecoratorProps:
//                                       DropDownDecoratorProps(
//                                     dropdownSearchDecoration: InputDecoration(
//                                       labelText: tr("Search Ingredients"),
//                                       hintText: tr("Search Ingredients"),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: const BorderSide(
//                                             color: buttonColor),
//                                         borderRadius: BorderRadius.circular(30),
//                                       ),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: const BorderSide(
//                                             color: Color(0xFF8D8D8D)),
//                                         borderRadius: BorderRadius.circular(30),
//                                       ),
//                                     ),
//                                   ),
//                                   dropdownButtonProps: DropdownButtonProps(
//                                     iconSize: 20,
//                                     icon: Transform.rotate(
//                                       angle: 90 * math.pi / 180,
//                                       child:
//                                           const Icon(Icons.arrow_forward_ios),
//                                     ),
//                                     color: buttonColor,
//                                   ),
//                                   onChanged: (value) {
//                                     setState(() {
//                                       selectedIngredient = value!;
//                                     });
//                                   },
//                                 ),
//                               )
//                             : const SizedBox(),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Visibility(
//                   visible: showsingle,
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               flex: 5,
//                               child: Container(
//                                 height: 30,
//                                 color: Colors.green,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(5.0),
//                                   child: Text(
//                                     'Default Purchase Price',
//                                     style: GoogleFonts.getFont('Poppins',
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 5,
//                               child: Container(
//                                 height: 30,
//                                 color: Colors.green,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(5.0),
//                                   child: Text(
//                                     'x Margin (%)',
//                                     style: GoogleFonts.getFont('Poppins',
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 5,
//                               child: Container(
//                                 height: 30,
//                                 color: Colors.green,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(5.0),
//                                   child: Text(
//                                     'Default Selling Price',
//                                     textAlign: TextAlign.left,
//                                     style: GoogleFonts.getFont('Poppins',
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             flex: 5,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 keyboardType: TextInputType.number,
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.allow(
//                                       RegExp(r'^\d*\.?\d{0,4}'))
//                                 ],
//                                 style: GoogleFonts.getFont('Poppins',
//                                     color: Colors.black),
//                                 decoration: InputDecoration(
//                                   hintText: 'Exc. tax',
//                                   labelText: 'Exc. tax',
//                                   floatingLabelBehavior:
//                                       FloatingLabelBehavior.auto,
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       horizontal: 20),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide:
//                                         const BorderSide(color: Colors.green),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   hintStyle: const TextStyle(
//                                       color: Colors.black, fontSize: 14),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 5,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 keyboardType: TextInputType.number,
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.allow(
//                                       RegExp(r'^\d*\.?\d{0,4}'))
//                                 ],
//                                 style: GoogleFonts.getFont('Poppins',
//                                     color: Colors.black),
//                                 decoration: InputDecoration(
//                                   hintText: 'x Margin (%)',
//                                   labelText: 'x Margin (%)',
//                                   floatingLabelBehavior:
//                                       FloatingLabelBehavior.auto,
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       horizontal: 20),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide:
//                                         const BorderSide(color: Colors.green),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   hintStyle: const TextStyle(
//                                       color: Colors.black, fontSize: 14),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 5,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 keyboardType: TextInputType.number,
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.allow(
//                                       RegExp(r'^\d*\.?\d{0,4}'))
//                                 ],
//                                 style: GoogleFonts.getFont('Poppins',
//                                     color: Colors.black),
//                                 decoration: InputDecoration(
//                                   hintText: 'Exc. tax',
//                                   labelText: 'Exc. tax',
//                                   floatingLabelBehavior:
//                                       FloatingLabelBehavior.auto,
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       horizontal: 20),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide:
//                                         const BorderSide(color: Colors.green),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   hintStyle: const TextStyle(
//                                       color: Colors.black, fontSize: 14),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Visibility(
//                   visible: showSearchIngredients,
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               flex: 7,
//                               child: Container(
//                                 height: 30,
//                                 color: Colors.green,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(5.0),
//                                   child: Text(
//                                     'Product Name',
//                                     textAlign: TextAlign.center,
//                                     style: GoogleFonts.getFont('Poppins',
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 4,
//                               child: Container(
//                                 height: 30,
//                                 color: Colors.green,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(5.0),
//                                   child: Text(
//                                     'Quantity',
//                                     textAlign: TextAlign.center,
//                                     style: GoogleFonts.getFont('Poppins',
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 4,
//                               child: Container(
//                                 height: 30,
//                                 color: Colors.green,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(5.0),
//                                   child: Text(
//                                     'Purchase Price (Excluding Tax)',
//                                     textAlign: TextAlign.center,
//                                     style: GoogleFonts.getFont('Poppins',
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 5,
//                               child: Container(
//                                 height: 30,
//                                 color: Colors.green,
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(5.0),
//                                   child: Text(
//                                     'Total Amount (Exc. Taxs)',
//                                     textAlign: TextAlign.center,
//                                     style: GoogleFonts.getFont('Poppins',
//                                         color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: Container(
//                                   height: 30,
//                                   color: Colors.green,
//                                   child: const Icon(
//                                     Icons.delete,
//                                     color: Colors.white,
//                                   )),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           const Expanded(
//                             flex: 7,
//                             child: Padding(
//                                 padding: EdgeInsets.only(left: 8.0),
//                                 child: Text(
//                                   'BJ SINGLE BTL- 8512701',
//                                   textAlign: TextAlign.center,
//                                 )),
//                           ),
//                           Expanded(
//                             flex: 3,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 keyboardType: TextInputType.number,
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.digitsOnly,
//                                 ],
//                                 textAlign: TextAlign.center,
//                                 style: GoogleFonts.getFont('Poppins',
//                                     color: Colors.black),
//                                 controller: quantityController,
//                                 decoration: InputDecoration(
//                                   prefixIcon: IconButton(
//                                     onPressed: () {
//                                       int value =
//                                           int.parse(quantityController.text);
//                                       if (value > 1) {
//                                         setState(() {
//                                           value--;
//                                           quantityController.text =
//                                               value.toString();
//                                         });
//                                       }
//                                     },
//                                     icon: const Icon(Icons.remove),
//                                   ),
//                                   suffixIcon: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       IconButton(
//                                         onPressed: () {
//                                           int value = int.parse(
//                                               quantityController.text);
//                                           setState(() {
//                                             value++;
//                                             quantityController.text =
//                                                 value.toString();
//                                           });
//                                         },
//                                         icon: const Icon(Icons.add),
//                                       ),
//                                     ],
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       horizontal: 20),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide:
//                                         const BorderSide(color: Colors.green),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   hintStyle: const TextStyle(
//                                       color: Colors.black, fontSize: 14),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           // Expanded(
//                           //   flex: 3,
//                           //   child: Padding(
//                           //     padding: const EdgeInsets.all(8.0),
//                           //     child: TextFormField(
//                           //       keyboardType: TextInputType.number,
//                           //       inputFormatters: [
//                           //         FilteringTextInputFormatter.digitsOnly
//                           //       ],
//                           //       textAlign: TextAlign.center,
//                           //       style: GoogleFonts.getFont('Poppins',
//                           //           color: Colors.black),
//                           //       decoration: InputDecoration(
//                           //         suffixIcon: const Icon(Icons.add),
//                           //         prefixIcon: const Icon(Icons.remove),
//                           //         enabledBorder: OutlineInputBorder(
//                           //           borderRadius: BorderRadius.circular(10),
//                           //         ),
//                           //         contentPadding: const EdgeInsets.symmetric(
//                           //             horizontal: 20),
//                           //         focusedBorder: OutlineInputBorder(
//                           //           borderSide:
//                           //               const BorderSide(color: Colors.green),
//                           //           borderRadius: BorderRadius.circular(10),
//                           //         ),
//                           //         border: OutlineInputBorder(
//                           //           borderRadius: BorderRadius.circular(10),
//                           //         ),
//                           //         hintStyle: const TextStyle(
//                           //             color: Colors.black, fontSize: 14),
//                           //       ),
//                           //     ),
//                           //   ),
//                           // ),
//                           const Expanded(
//                             flex: 4,
//                             child: Text(
//                               "\$ 0.00",
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           const Expanded(
//                             flex: 5,
//                             child: Text(
//                               "\$ 0.00",
//                               textAlign: TextAlign.center,
//                             ),
//                           ),
//                           const Expanded(
//                               flex: 1,
//                               child: Padding(
//                                 padding: EdgeInsets.only(right: 10.0),
//                                 child: Icon(
//                                   Icons.cancel_outlined,
//                                   color: Colors.red,
//                                   size: 30,
//                                 ),
//                               )),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         children: [
//                           Expanded(
//                             flex: 5,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 keyboardType: TextInputType.number,
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.allow(
//                                       RegExp(r'^\d*\.?\d{0,4}'))
//                                 ],
//                                 style: GoogleFonts.getFont('Poppins',
//                                     color: Colors.black),
//                                 decoration: InputDecoration(
//                                   hintText: 'x Margin (%)',
//                                   labelText: 'x Margin (%)',
//                                   floatingLabelBehavior:
//                                       FloatingLabelBehavior.auto,
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       horizontal: 20),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide:
//                                         const BorderSide(color: Colors.green),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   hintStyle: const TextStyle(
//                                       color: Colors.black, fontSize: 14),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             flex: 5,
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: TextFormField(
//                                 keyboardType: TextInputType.number,
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.allow(
//                                       RegExp(r'^\d*\.?\d{0,4}'))
//                                 ],
//                                 style: Google
//                                 Fonts.getFont('Poppins',
//                                     color: Colors.black),
//                                 decoration: InputDecoration(
//                                   hintText: 'Default Selling Price',
//                                   labelText: 'Default Selling Price',
//                                   floatingLabelBehavior:
//                                       FloatingLabelBehavior.auto,
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   contentPadding: const EdgeInsets.symmetric(
//                                       horizontal: 20),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderSide:
//                                         const BorderSide(color: Colors.green),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   hintStyle: const TextStyle(
//                                       color: Colors.black, fontSize: 14),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const Expanded(
//                             flex: 5,
//                             child: Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: ListTile(
//                                 title: Text('Net Total Amount'),
//                                 trailing: Text('\$0:00'),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
