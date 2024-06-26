import 'package:flutter/material.dart';
import 'package:mcakes/widgets/contact_us_widget.dart';
import 'package:mcakes/widgets/footer_widget.dart';
import 'package:mcakes/widgets/locate_us_widget.dart';
import 'package:mcakes/widgets/toast_widget.dart';

import '../../utlis/colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';
import '../../widgets/textfield_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
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
            height: 500,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/brooke-lark-pGM4sjt_BdQ-unsplash.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: TextWidget(
              text: 'WHAT YOU CAN DO',
              fontSize: 48,
              fontFamily: 'Bold',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(
                    text: 'Freshed bakes cakes\n and pastries',
                    fontSize: 32,
                    fontFamily: 'Bold',
                  ),
                  TextWidget(
                    maxLines: 5,
                    text:
                        'Get a taste of our freshly prepared\ncakes by ordering online',
                    fontSize: 18,
                    fontFamily: 'Regular',
                    color: Colors.grey,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(
                    text: 'Different Shops',
                    fontSize: 32,
                    fontFamily: 'Bold',
                  ),
                  TextWidget(
                    maxLines: 5,
                    text:
                        'You can choose different shops and order your cakes\nand pastries with your favourite glazing, toppings, color and more!',
                    fontSize: 18,
                    fontFamily: 'Regular',
                    color: Colors.grey,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextWidget(
                    text: 'Custom cake box',
                    fontSize: 32,
                    fontFamily: 'Bold',
                  ),
                  TextWidget(
                    maxLines: 5,
                    text:
                        'You can add  different types of\ncakes in a box and we deliver it to you!',
                    fontSize: 18,
                    fontFamily: 'Regular',
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.pink[100],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                  text: 'Open your online bakeshop store!',
                  fontSize: 32,
                  fontFamily: 'Bold',
                  color: Colors.white,
                ),
                TextWidget(
                  maxLines: 5,
                  text: 'Your baked goods all in one place!',
                  fontSize: 18,
                  fontFamily: 'Regular',
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  radius: 100,
                  color: primary,
                  label: 'Create my store',
                  onPressed: () {
                    showToast('Not available!');
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: TextWidget(
              text: 'HOW TO ORDER',
              fontSize: 48,
              fontFamily: 'Bold',
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextWidget(
                text: 'Choose your cake',
                fontSize: 24,
                fontFamily: 'Bold',
              ),
              TextWidget(
                text: 'Add to cart',
                fontSize: 24,
                fontFamily: 'Bold',
              ),
              TextWidget(
                text: 'Checkout',
                fontSize: 24,
                fontFamily: 'Bold',
              ),
              TextWidget(
                text: 'We pack it up',
                fontSize: 24,
                fontFamily: 'Bold',
              ),
              TextWidget(
                text: 'Fast Delivery',
                fontSize: 24,
                fontFamily: 'Bold',
              ),
            ],
          ),
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
                      color: Colors.pink,
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
                            color: Colors.pink,
                            child: const Icon(
                              Icons.person_3_outlined,
                              color: Colors.white,
                              size: 150,
                            ),
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
                            color: Colors.pink,
                            child: const Icon(
                              Icons.person_3_outlined,
                              color: Colors.white,
                              size: 150,
                            ),
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
                            color: Colors.pink,
                            child: const Icon(
                              Icons.person_3_outlined,
                              color: Colors.white,
                              size: 150,
                            ),
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
                onPressed: () {
                  showToast('Your subscription was added!');
                },
              ),
            ],
          ),
          const FooterWidget(),
        ],
      ),
    );
  }
}
