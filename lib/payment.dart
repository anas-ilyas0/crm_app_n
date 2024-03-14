import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final cardNo = TextEditingController();
  final expiryDate = TextEditingController();
  final cvv = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context)
                      .modalBarrierDismissLabel,
                  barrierColor: Colors.black.withOpacity(0.5),
                  transitionDuration: const Duration(milliseconds: 200),
                  pageBuilder: (BuildContext context, Animation animation,
                      Animation animation1) {
                    return StatefulBuilder(builder: (context, set) {
                      return Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Material(
                            // Material widget
                            child: Container(
                              height: 470,
                              width: 320,
                              padding: const EdgeInsets.all(15),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize
                                      .min, // Set mainAxisSize to min
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text('Payment Method',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('First Name*'),
                                              textFormField(
                                                  'First Name', firstName),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            width:
                                                10), // Add space between columns
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Last Name*'),
                                              textFormField(
                                                  'Last Name', lastName),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Text('Card No*'),
                                    textFormField(
                                        'Enter your card number', cardNo,
                                        textInputType: TextInputType.number),
                                    SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Expiration Date*'),
                                              textFormField(
                                                'MM-YY',
                                                expiryDate,
                                                textInputType: TextInputType
                                                    .numberWithOptions(
                                                        decimal: true),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            width:
                                                10), // Add space between columns
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('CVV*'),
                                              textFormField('CVV', cvv,
                                                  textInputType:
                                                      TextInputType.number),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 40),
                                    button('Cancel', () {
                                      Navigator.pop(context);
                                    },
                                        backgroundcolor: Colors.white,
                                        textColor: Colors.black,
                                        borderColor: Colors.black),
                                    SizedBox(height: 10),
                                    button('Pay', () {
                                      String message = '';
                                      if (firstName.text.isEmpty) {
                                        message = 'First name is required';
                                      } else if (lastName.text.isEmpty) {
                                        message = 'Last name is required';
                                      } else if (cardNo.text.isEmpty) {
                                        message = 'Card number is required';
                                      } else if (expiryDate.text.isEmpty) {
                                        message = 'Expiration date is required';
                                      } else if (cvv.text.isEmpty) {
                                        message = 'CVV is required';
                                      } else {
                                        awesomeDialog();
                                        // showDialog(
                                        //     barrierLabel:
                                        //         MaterialLocalizations.of(
                                        //                 context)
                                        //             .modalBarrierDismissLabel,
                                        //     barrierColor:
                                        //         Colors.black.withOpacity(0.5),
                                        //     barrierDismissible: true,
                                        //     context: context,
                                        //     builder: (BuildContext context) {
                                        //       return awesomeDialog();
                                        // AwesomeDialog(
                                        //   context: context,
                                        //   dialogType: DialogType.info,
                                        //   animType: AnimType.rightSlide,
                                        //   title: 'Dialog Title',
                                        //   desc:
                                        //       'Dialog description here.............',
                                        //   btnCancelOnPress: () {},
                                        //   btnOkOnPress: () {},
                                        // )..show();
                                        // AlertDialog(
                                        //   backgroundColor: Colors.white,
                                        //   title: Text(
                                        //     'Are you sure you want to pay?',
                                        //     style:
                                        //         TextStyle(fontSize: 17),
                                        //   ),
                                        //   actions: [
                                        //     button('Cancel', () {
                                        //       Navigator.pop(context);
                                        //     },
                                        //         backgroundcolor:
                                        //             Colors.white,
                                        //         textColor: Colors.black,
                                        //         borderColor:
                                        //             Colors.black),
                                        //     button('OK', () {
                                        //       Navigator.pop(context);
                                        //     },
                                        //         backgroundcolor:
                                        //             Colors.blue,
                                        //         textColor: Colors.white,
                                        //         borderColor: Colors.blue)
                                        //   ],
                                        // );
                                        //});
                                      }
                                      if (message.isNotEmpty) {
                                        Fluttertoast.showToast(msg: message);
                                      }
                                    },
                                        backgroundcolor: Colors.blue,
                                        textColor: Colors.white,
                                        borderColor: Colors.blue),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  },
                );
              },
              child: Text(
                'Add Card Information',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textFormField(String hint, TextEditingController controller,
      {TextInputType? textInputType}) {
    return TextFormField(
      controller: controller,
      showCursor: false,
      keyboardType: textInputType,
      style: TextStyle(height: 0.1),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
        border: OutlineInputBorder(),
      ),
    );
  }

  void awesomeDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      title: 'Advance Reservation',
      desc: 'Are you sure you wants to pay for advance reservation?',
      btnOkOnPress: () {},
      btnCancelOnPress: () {},
    )..show();
  }

  Widget button(String text, VoidCallback onPress,
      {Color? backgroundcolor, Color? textColor, Color? borderColor}) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              side: BorderSide(color: borderColor ?? Colors.transparent),
              backgroundColor: backgroundcolor),
          onPressed: onPress,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          )),
    );
  }
}
