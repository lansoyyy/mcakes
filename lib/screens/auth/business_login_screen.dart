import 'package:flutter/material.dart';
import 'package:mcakes/screens/business/business_home_screen.dart';
import 'package:mcakes/widgets/text_widget.dart';

import '../../utlis/colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/textfield_widget.dart';
import '../home_screen.dart';

class BusinessLoginPage extends StatefulWidget {
  const BusinessLoginPage({super.key});

  @override
  State<BusinessLoginPage> createState() => _BusinessLoginPageState();
}

class _BusinessLoginPageState extends State<BusinessLoginPage> {
  final password = TextEditingController();

  final email = TextEditingController();

  final name = TextEditingController();
  final desc = TextEditingController();
  final caption = TextEditingController();
  final opening = TextEditingController();
  final closing = TextEditingController();
  final deliveryfee = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 75,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'MCakes',
                      fontSize: 75,
                      color: primary,
                      fontFamily: 'Bold',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 450,
                      width: 600,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'LOGIN',
                      fontSize: 24,
                      color: Colors.black,
                      fontFamily: 'Bold',
                    ),
                    TextWidget(
                        text: 'Welcome back! Please enter your details',
                        fontSize: 16,
                        color: Colors.black),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        label: 'Business Email: ', controller: email),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        isObscure: true,
                        label: 'Password: ',
                        controller: password),
                    // TextButton(
                    //     onPressed: (() {}),
                    //     child: TextBold(
                    //         text: 'Forgot Password?',
                    //         fontSize: 12,
                    //         color: Colors.black)),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ButtonWidget(
                          color: primary,
                          label: 'Login',
                          onPressed: (() async {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BusinessHomeScreen()));
                          })),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: "Don't have an account?",
                            fontSize: 12,
                          ),
                          TextButton(
                            onPressed: () {
                              createAccountDialog();
                            },
                            child: TextWidget(
                              text: 'Create one',
                              fontSize: 13,
                              fontFamily: 'Bold',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: TextWidget(
                          text: 'Continue as User',
                          fontSize: 13,
                          fontFamily: 'Bold',
                          color: primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 400, right: 400, bottom: 20),
                child: TextWidget(
                    text:
                        'Republic Act No. 10173, otherwise known as the Data Privacy Act is a law that seeks to protect all forms of information, be it private, personal, or sensitive. It is meant to cover both natural and juridical persons involved in the processing of personal information.',
                    fontSize: 12,
                    color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }

  createAccountDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            width: 350,
            height: 600,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      color: Colors.black,
                      controller: name,
                      label: 'Store Name',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      color: Colors.black,
                      controller: desc,
                      label: 'Store Description',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      color: Colors.black,
                      controller: caption,
                      label: 'Store Caption',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      color: Colors.black,
                      controller: opening,
                      label: 'Opening Time',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      color: Colors.black,
                      controller: closing,
                      label: 'Closing Time',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      color: Colors.black,
                      controller: deliveryfee,
                      label: 'Delivery Fee',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      showEye: true,
                      isObscure: true,
                      color: Colors.black,
                      controller: email,
                      label: 'Business Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      showEye: true,
                      isObscure: true,
                      color: Colors.black,
                      controller: password,
                      label: 'Password',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ButtonWidget(
                          color: primary,
                          label: 'Create',
                          onPressed: (() async {
                            Navigator.pop(context);
                          })),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
