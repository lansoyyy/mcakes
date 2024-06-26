import 'package:flutter/material.dart';
import 'package:mcakes/screens/auth/login_screen.dart';
import 'package:mcakes/screens/cart_screen.dart';
import 'package:mcakes/screens/profile_screen.dart';
import 'package:mcakes/screens/tabs/about_us_tab.dart';
import 'package:mcakes/screens/tabs/home_tab.dart';
import 'package:mcakes/screens/tabs/store_tab.dart';
import 'package:mcakes/widgets/button_widget.dart';
import 'package:mcakes/widgets/contact_us_widget.dart';
import 'package:mcakes/widgets/text_widget.dart';
import 'package:mcakes/widgets/textfield_widget.dart';

import '../utlis/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final ordernumber = TextEditingController();
  final message = TextEditingController();
  final newemail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'MCakes',
                    fontSize: 75,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    width: 200,
                  ),
                  SizedBox(
                    height: 50,
                    width: 500,
                    child: TabBar(
                        indicatorColor: primary,
                        unselectedLabelColor: Colors.grey,
                        labelColor: Colors.pink,
                        labelStyle: TextStyle(
                            color: primary, fontFamily: 'Bold', fontSize: 14),
                        tabs: const [
                          Tab(
                            text: 'HOME',
                          ),
                          Tab(
                            text: 'STORES',
                          ),
                          Tab(
                            text: 'ABOUT',
                          ),
                          Tab(
                            text: 'CONTACT US',
                          ),
                        ]),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                    },
                    icon: const Icon(
                      Icons.account_circle_outlined,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const Text(
                                  'Logout Confirmation',
                                  style: TextStyle(
                                      fontFamily: 'QBold',
                                      fontWeight: FontWeight.bold),
                                ),
                                content: const Text(
                                  'Are you sure you want to Logout?',
                                  style: TextStyle(fontFamily: 'QRegular'),
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: const Text(
                                      'Close',
                                      style: TextStyle(
                                          fontFamily: 'QRegular',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  MaterialButton(
                                    onPressed: () async {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage()));
                                    },
                                    child: const Text(
                                      'Continue',
                                      style: TextStyle(
                                          fontFamily: 'QRegular',
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ));
                    },
                    icon: const Icon(
                      Icons.logout,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Expanded(
                child: TabBarView(children: [
                  HomeTab(),
                  StoreTab(),
                  AboutUsTab(),
                  ContactUsWidget(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
