import 'package:flutter/material.dart';
import 'package:mcakes/widgets/footer_widget.dart';
import 'package:mcakes/widgets/text_widget.dart';

import '../../utlis/colors.dart';
import '../../widgets/button_widget.dart';

class StoreTab extends StatefulWidget {
  const StoreTab({super.key});

  @override
  State<StoreTab> createState() => _StoreTabState();
}

class _StoreTabState extends State<StoreTab> {
  final searchController = TextEditingController();
  String nameSearched = '';

  bool hasvisited = false;
  bool isproduct = false;
  @override
  Widget build(BuildContext context) {
    return isproduct
        ? productWidget()
        : hasvisited
            ? storeWidget()
            : listWidget();
  }

  Widget listWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Find a store:',
                fontSize: 16,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: 700,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {
                      nameSearched = value;
                    });
                  },
                  decoration: const InputDecoration(
                      hintText: 'Search for a store',
                      hintStyle: TextStyle(fontFamily: 'QRegular'),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      )),
                  controller: searchController,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 1000,
            height: 500,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  color: Colors.pink[100],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: 'Czar Store',
                        fontSize: 24,
                        fontFamily: 'Bold',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                        text: 'Opening Time: 8:00 AM',
                        fontSize: 12,
                        fontFamily: 'Bold',
                      ),
                      TextWidget(
                        text: 'Closing Time: 5:00 PM',
                        fontSize: 12,
                        fontFamily: 'Bold',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonWidget(
                        radius: 100,
                        color: primary,
                        fontSize: 14,
                        width: 125,
                        height: 45,
                        label: 'Visit Store',
                        onPressed: () {
                          setState(() {
                            hasvisited = true;
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const FooterWidget(),
        ],
      ),
    );
  }

  Widget storeWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.grey[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                  text: 'CZAR STORE',
                  fontSize: 65,
                  fontFamily: 'Bold',
                  color: Colors.white,
                ),
                TextWidget(
                  text: 'Barato na, Lami pa!',
                  fontSize: 24,
                  fontFamily: 'Bold',
                  color: Colors.white,
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
                          text: 'About Us',
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                      text: 'Creating Imagination to Reality.',
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 5,
                    ),
                    TextWidget(
                      text: 'Opening Time: 8:00 AM',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    TextWidget(
                      text: 'Closing Time: 5:00 PM',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    TextWidget(
                      text: 'Delivery Fee: 100 Php',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 900,
                height: 500,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isproduct = true;
                        });
                      },
                      child: Card(
                        elevation: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 150,
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
    );
  }

  Widget productWidget() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.grey[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                  text: 'CZAR STORE',
                  fontSize: 65,
                  fontFamily: 'Bold',
                  color: Colors.white,
                ),
                TextWidget(
                  text: 'Barato na, Lami pa!',
                  fontSize: 24,
                  fontFamily: 'Bold',
                  color: Colors.white,
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
              Container(
                width: 600,
                height: 500,
                color: Colors.grey[200],
              ),
              const SizedBox(
                width: 50,
              ),
              SizedBox(
                width: 500,
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Choco Cake Slice',
                      fontSize: 32,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                      text: '₱150.00',
                      fontSize: 24,
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
                          text: '47 stock/s left',
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextWidget(
                          text: '1',
                          fontSize: 32,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                          ),
                        ),
                      ],
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
                      label: 'Add to Cart',
                      onPressed: () {
                        setState(() {
                          hasvisited = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextWidget(
            text: 'Description',
            fontSize: 24,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: primary,
          ),
        ],
      ),
    );
  }
}
