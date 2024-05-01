import 'package:flutter/material.dart';
import 'package:mcakes/widgets/toast_widget.dart';

import '../utlis/colors.dart';
import 'button_widget.dart';
import 'text_widget.dart';
import 'textfield_widget.dart';

class ContactUsWidget extends StatefulWidget {
  const ContactUsWidget({super.key});

  @override
  State<ContactUsWidget> createState() => _ContactUsWidgetState();
}

class _ContactUsWidgetState extends State<ContactUsWidget> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final ordernumber = TextEditingController();
  final message = TextEditingController();
  final newemail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 800,
            decoration: const BoxDecoration(
              color: Colors.black38,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(
                    text: 'CONTACT US',
                    fontSize: 48,
                    color: Colors.white,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 800,
                    child: TextWidget(
                      maxLines: 3,
                      text:
                          'Our Company is the best, meet the creative team that never sleeps. Say something to us we will answer to you.',
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'Medium',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    width: 700,
                    controller: name,
                    label: 'Name',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    width: 700,
                    controller: email,
                    label: 'Email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    width: 700,
                    controller: phone,
                    label: 'Phone',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    width: 700,
                    controller: ordernumber,
                    label: 'Order Number',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    width: 700,
                    height: 100,
                    maxLine: 5,
                    controller: message,
                    label: 'Your Message',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonWidget(
                    radius: 100,
                    color: primary,
                    label: 'SUBMIT',
                    onPressed: () {
                      name.clear();
                      email.clear();
                      phone.clear();
                      ordernumber.clear();
                      message.clear();
                      newemail.clear();
                      showToast('Your message was submitted!');
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
