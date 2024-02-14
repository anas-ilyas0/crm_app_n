// ignore_for_file: avoid_print, avoid_unnecessary_containers, use_build_context_synchronously
import 'package:crm_new/home.dart';
import 'package:crm_new/utils/utils.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  bool? isChecked = false;
  bool passwordVisible = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: PopScope(
      //   canPop: false,
      //   onPopInvoked: (bool didPop) {
      //     if (didPop) {
      //       return;
      //     }
      //     showDialog(
      //         context: context,
      //         builder: (BuildContext context) {
      //           return AlertDialog(
      //             title: const Text('Are you sure you want to go back'),
      //             actions: [
      //               ElevatedButton(
      //                   onPressed: () {
      //                     Navigator.pop(context);
      //                   },
      //                   child: const Text('Cancel')),
      //               ElevatedButton(
      //                   onPressed: () {
      //                     SystemChannels.platform
      //                         .invokeMethod('SystemNavigator.pop');
      //                   },
      //                   child: const Text('Yes'))
      //             ],
      //           );
      //         });
      //   },
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F2),
        body: ListView(
          shrinkWrap: true,
          reverse: false,
          children: [
            Center(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Container(
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Image(image: AssetImage('images/login.png')),
                        ),
                        SizedBox(width: 20),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text('CRM',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 24)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'Sign In to CRM',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 40),
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Email Address',
                                  style: TextStyle(fontSize: 17),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: email,
                                    focusNode: emailFocusNode,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        hintText: 'youremail@gmail.com',
                                        hintStyle: const TextStyle(
                                            color: Colors.grey)),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                              .hasMatch(value)) {
                                        return "Please enter an email address";
                                      } else {
                                        return null;
                                      }
                                    },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    onFieldSubmitted: (value) {
                                      Utils.fieldFocusChange(context,
                                          emailFocusNode, passwordFocusNode);
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Password',
                                          style: TextStyle(fontSize: 18),
                                        )),
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    controller: password,
                                    focusNode: passwordFocusNode,
                                    obscureText: !passwordVisible,
                                    decoration: InputDecoration(
                                      // suffixIconConstraints: const BoxConstraints(
                                      //   minHeight: 24,
                                      //   minWidth: 50,
                                      // ),
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              passwordVisible =
                                                  !passwordVisible;
                                            });
                                          },
                                          icon: Icon(
                                            passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          )),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      hintText: '........',
                                      hintStyle: const TextStyle(fontSize: 20),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return ('Please enter your password');
                                      }
                                      return null;
                                    },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  value: isChecked,
                                  activeColor: Colors.blue,
                                  tristate: false,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value;
                                    });
                                  }),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                              const SizedBox(width: 45),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: 400,
                              height: 60,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      String enteredEmail = email.text;
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (BuildContext context) {
                                        return Home(username: enteredEmail);
                                      }));
                                      // setState(() {
                                      //   isLoading = true;
                                      // });
                                      // String enteredEmail = email.text;
                                      // var res = await performLogin(
                                      //     email.text, password.text);
                                      // if (res.statusCode == 500) {
                                      //   print('Successfully Login');
                                      //   setState(() {
                                      //     isLoading = false;
                                      //   });
                                      //   if (!mounted) return;
                                      //   Navigator.push(context,
                                      //       MaterialPageRoute(builder:
                                      //           (BuildContext context) {
                                      //     return Home(username: enteredEmail);
                                      //   }));
                                      // } else {
                                      //   print(
                                      //       'Something went wrong : ${res.statusCode}');
                                      //   Utils.flushBarErrorMessage(
                                      //       context, '${res.statusCode}');
                                      //   setState(() {
                                      //     isLoading = false;
                                      //   });
                                      // }
                                    }
                                  },
                                  child: isLoading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : const Text(
                                          'Sign In  >',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ]),
            )
          ].reversed.toList(),
        ),
      ),
    );
  }
}
