import 'package:flutter/material.dart';
import 'package:mcakes/utlis/colors.dart';
import 'package:mcakes/widgets/locate_us_widget.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/contact_us_widget.dart';
import '../../widgets/footer_widget.dart';
import '../../widgets/text_widget.dart';
import '../../widgets/textfield_widget.dart';

class AboutUsTab extends StatefulWidget {
  const AboutUsTab({super.key});

  @override
  State<AboutUsTab> createState() => _AboutUsTabState();
}

class _AboutUsTabState extends State<AboutUsTab> {
  final newemail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 550,
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: TextWidget(
                      text: 'OUR BAKERS',
                      fontSize: 32,
                      fontFamily: 'Bold',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 275,
                            height: 300,
                            color: Colors.black,
                          ),
                          Container(
                            width: 275,
                            height: 125,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextWidget(
                                  text: 'Riza Bahian',
                                  fontSize: 24,
                                  fontFamily: 'Bold',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextWidget(
                                  text: 'CEO - Bakery Shop',
                                  fontSize: 16,
                                  fontFamily: 'Regular',
                                  color: primary,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextWidget(
                                  maxLines: 3,
                                  text:
                                      'Jelly topping halvah caramels sweet cake\ngummy bears toffee',
                                  fontSize: 13,
                                  fontFamily: 'Regular',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 275,
                            height: 300,
                            color: Colors.black,
                          ),
                          Container(
                            width: 275,
                            height: 125,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextWidget(
                                  text: 'Mark Bahian',
                                  fontSize: 24,
                                  fontFamily: 'Bold',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextWidget(
                                  text: 'COFOUNDER',
                                  fontSize: 16,
                                  fontFamily: 'Regular',
                                  color: primary,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextWidget(
                                  maxLines: 3,
                                  text:
                                      'Jelly topping halvah caramels sweet cake\ngummy bears toffee',
                                  fontSize: 13,
                                  fontFamily: 'Regular',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: 275,
                            height: 300,
                            color: Colors.black,
                          ),
                          Container(
                            width: 275,
                            height: 125,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextWidget(
                                  text: 'Anonymous',
                                  fontSize: 24,
                                  fontFamily: 'Bold',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextWidget(
                                  text: 'MASTER BAKER',
                                  fontSize: 16,
                                  fontFamily: 'Regular',
                                  color: primary,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextWidget(
                                  maxLines: 3,
                                  text:
                                      'Jelly topping halvah caramels sweet cake\ngummy bears toffee',
                                  fontSize: 13,
                                  fontFamily: 'Regular',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const LocateUsWidget(),
          const ContactUsWidget(),
          TextWidget(
            text: 'NEWSLETTER',
            fontSize: 48,
            color: primary,
            fontFamily: 'Bold',
          ),
          const SizedBox(
            height: 20,
          ),
          TextWidget(
            maxLines: 3,
            text: 'Be the first to get informed about our best deals!',
            fontSize: 24,
            color: Colors.black,
            fontFamily: 'Medium',
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFieldWidget(
                width: 500,
                controller: newemail,
                label: 'Enter your email',
              ),
              const SizedBox(
                width: 30,
              ),
              ButtonWidget(
                radius: 100,
                width: 100,
                color: primary,
                label: 'SUBSCRIBE',
                onPressed: () {},
              ),
            ],
          ),
          const FooterWidget(),
        ],
      ),
    );
  }
}
