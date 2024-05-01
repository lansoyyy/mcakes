import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mcakes/services/add_product.dart';
import 'package:mcakes/widgets/textfield_widget.dart';
import 'package:mcakes/widgets/toast_widget.dart';

import '../../utlis/colors.dart';
import '../../widgets/text_widget.dart';

class BusinessHomeScreen extends StatefulWidget {
  const BusinessHomeScreen({super.key});

  @override
  State<BusinessHomeScreen> createState() => _BusinessHomeScreenState();
}

class _BusinessHomeScreenState extends State<BusinessHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
        .collection('Business')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    return DefaultTabController(
      length: 3,
      child: StreamBuilder<DocumentSnapshot>(
          stream: userData,
          builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }
            dynamic data = snapshot.data;
            return Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: primary,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                //Image? fromPicker =
                                //     await ImagePickerWeb.getImageAsWidget();
                                uploadToStorage();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[500],
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                  child: TextWidget(
                                    text: 'Upload Image',
                                    fontSize: 14,
                                    fontFamily: 'Bold',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFieldWidget(
                              controller: name,
                              label: 'Product Name',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFieldWidget(
                              controller: price,
                              label: 'Product Price',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: TextWidget(
                              text: 'Close',
                              fontSize: 18,
                              fontFamily: 'Bold',
                              color: primary,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              addProduct(name.text, price.text, imgUrl);
                              Navigator.pop(context);
                            },
                            child: TextWidget(
                              text: 'Add Product',
                              fontSize: 18,
                              fontFamily: 'Bold',
                              color: primary,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 150,
                        color: primary,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextWidget(
                              text: data['name'],
                              fontSize: 65,
                              fontFamily: 'Bold',
                              color: Colors.white,
                            ),
                            TextWidget(
                              text: data['caption'],
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
                                      child: Image.network(
                                        data['img'],
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
                                  text: data['desc'],
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                                const Divider(),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextWidget(
                                  text: 'Opening Time: ${data['opening']}',
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                TextWidget(
                                  text: 'Closing Time: ${data['closing']}',
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                TextWidget(
                                  text:
                                      'Delivery Fee: ${data['deliveryfee']} Php',
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
                              SizedBox(
                                width: 300,
                                child: TabBar(
                                  indicatorColor: primary,
                                  unselectedLabelColor: Colors.grey,
                                  labelColor: Colors.pink,
                                  labelStyle: TextStyle(
                                      color: primary,
                                      fontFamily: 'Bold',
                                      fontSize: 14),
                                  tabs: const [
                                    Tab(
                                      text: 'Products',
                                    ),
                                    Tab(
                                      text: 'History',
                                    ),
                                    Tab(
                                      text: 'Orders',
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 900,
                                height: 500,
                                child: TabBarView(
                                  children: [
                                    product(false),
                                    history(),
                                    orders(),
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
            );
          }),
    );
  }

  final name = TextEditingController();

  final price = TextEditingController();

  Widget product(bool inedit) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Products')
            .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('error');
            return const Center(child: Text('Error'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.black,
              )),
            );
          }

          final data = snapshot.requireData;
          return SizedBox(
            width: 900,
            height: 500,
            child: GridView.builder(
              itemCount: data.docs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      name.text = '${data.docs[index]['name']}';
                      price.text = '${data.docs[index]['price']}';
                    });
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content:
                              StatefulBuilder(builder: (context, setState) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 150,
                                  color: Colors.grey[200],
                                  child: Image.network(data.docs[index]['img']),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFieldWidget(
                                  controller: name,
                                  label: 'Product Name',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFieldWidget(
                                  controller: price,
                                  label: 'Product Price',
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection('Products')
                                        .where('uid',
                                            isEqualTo: FirebaseAuth
                                                .instance.currentUser!.uid)
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (snapshot.hasError) {
                                        print('error');
                                        return const Center(
                                            child: Text('Error'));
                                      }
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Padding(
                                          padding: EdgeInsets.only(top: 50),
                                          child: Center(
                                              child: CircularProgressIndicator(
                                            color: Colors.black,
                                          )),
                                        );
                                      }

                                      final data1 = snapshot.requireData;
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () async {
                                              if (data1.docs[index]['qty'] >
                                                  0) {
                                                await FirebaseFirestore.instance
                                                    .collection('Products')
                                                    .doc(data1.docs[index].id)
                                                    .update({
                                                  'qty':
                                                      FieldValue.increment(-1)
                                                });

                                                setState(
                                                  () {},
                                                );
                                              }
                                            },
                                            icon: const Icon(
                                              Icons.remove,
                                            ),
                                          ),
                                          TextWidget(
                                            text: '${data1.docs[index]['qty']}',
                                            fontSize: 24,
                                            fontFamily: 'Bold',
                                          ),
                                          IconButton(
                                            onPressed: () async {
                                              await FirebaseFirestore.instance
                                                  .collection('Products')
                                                  .doc(data1.docs[index].id)
                                                  .update({
                                                'qty': FieldValue.increment(1)
                                              });
                                              setState(
                                                () {},
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                              ],
                            );
                          }),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: TextWidget(
                                text: 'Close',
                                fontSize: 18,
                                fontFamily: 'Bold',
                                color: primary,
                              ),
                            ),
                          ],
                        );
                      },
                    );
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
                          text: '${data.docs[index]['name']}',
                          fontSize: 13,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextWidget(
                          text: '₱${data.docs[index]['price']}.00',
                          fontSize: 16,
                          fontFamily: 'Bold',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        });
  }

  Widget history() {
    return SizedBox(
      width: 900,
      height: 500,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return GestureDetector(
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
                    text: '₱300.00',
                    fontSize: 16,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    text: DateTime.now().toString(),
                    fontSize: 16,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    text: 'by: John Doe',
                    fontSize: 24,
                    fontFamily: 'Bold',
                    color: primary,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget orders() {
    return SizedBox(
      width: 900,
      height: 500,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return GestureDetector(
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
                    text: '₱150.00 x 2 = ₱300.00',
                    fontSize: 16,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    text: DateTime.now().toString(),
                    fontSize: 16,
                    fontFamily: 'Bold',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    text: 'by: John Doe',
                    fontSize: 24,
                    fontFamily: 'Bold',
                    color: primary,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  late String? imgUrl = '';

  uploadToStorage() {
    InputElement input = FileUploadInputElement() as InputElement
      ..accept = 'image/*';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot = await fs.ref().child('newfile').putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        showToast('Uploaded Succesfully!');
        print(downloadUrl);
        setState(() {
          imgUrl = downloadUrl;
        });
      });
    });
  }
}
