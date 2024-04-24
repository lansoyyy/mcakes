import 'package:flutter/material.dart';

import '../utlis/colors.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 600,
                    height: 500,
                    color: Colors.grey[200],
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: ListTile(
                            leading: Container(
                              width: 75,
                              height: 75,
                              color: Colors.black38,
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: 'Choco Cake Slice',
                                  fontSize: 18,
                                  fontFamily: 'Bold',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextWidget(
                                  text: '₱150.00',
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            trailing: const Icon(
                              Icons.check_box_outline_blank_rounded,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    width: 500,
                    height: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: 'Total: ₱150.00',
                          fontSize: 32,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextWidget(
                              text: '47 items',
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ButtonWidget(
                          radius: 5,
                          color: primary,
                          fontSize: 24,
                          width: 300,
                          height: 50,
                          label: 'Checkout',
                          onPressed: () {},
                        ),
                      ],
                    ),
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
