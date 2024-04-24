import 'package:flutter/material.dart';
import 'package:mcakes/utlis/colors.dart';

import '../widgets/text_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 150,
                color: primary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    height: 700,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.asset(
                                'assets/images/profile.png',
                                height: 200,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextWidget(
                              text: 'About Me',
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 5,
                        ),
                        TextWidget(
                          text: 'Name: ',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        TextWidget(
                          text: 'Contact Number: ',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        TextWidget(
                          text: 'Email: ',
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'Purchase History',
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 900,
                        height: 500,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Card(
                                elevation: 5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 125,
                                      color: Colors.grey[200],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextWidget(
                                      text: 'CHOCO CAKE SLICE',
                                      fontSize: 13,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextWidget(
                                      text: '₱150.00',
                                      fontSize: 16,
                                      fontFamily: 'Bold',
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextWidget(
                                      text: 'Completed',
                                      fontSize: 12,
                                      fontFamily: 'Bold',
                                      color: primary,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
    );
  }
}
