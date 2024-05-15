import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcakes/services/add_order.dart';
import 'package:mcakes/widgets/toast_widget.dart';

import '../utlis/colors.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int total = 0;

  List itemnames = [];
  List itemprices = [];
  List itemids = [];
  List itemqty = [];
  List itemimg = [];
  List<bool> added = [];

  String id = '';
  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots();
    return StreamBuilder<DocumentSnapshot>(
        stream: userData,
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          }
          dynamic mydata = snapshot.data;
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
                        StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Cart')
                                .where('uid',
                                    isEqualTo:
                                        FirebaseAuth.instance.currentUser!.uid)
                                .where('status', isEqualTo: 'Pending')
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                print('error');
                                return const Center(child: Text('Error'));
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

                              final data = snapshot.requireData;

                              return Container(
                                width: 600,
                                height: 500,
                                color: Colors.grey[200],
                                child: ListView.builder(
                                  itemCount: data.docs.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, bottom: 10),
                                      child: ListTile(
                                          leading: SizedBox(
                                            width: 75,
                                            height: 75,
                                            child: Image.network(
                                                data.docs[index]['img']),
                                          ),
                                          title: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              TextWidget(
                                                text: data.docs[index]['name'],
                                                fontSize: 18,
                                                fontFamily: 'Bold',
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              TextWidget(
                                                text:
                                                    '₱${data.docs[index]['price']}.00 x ${data.docs[index]['qty']}',
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            ],
                                          ),
                                          trailing: Checkbox(
                                            value: data.docs[index]['checked'],
                                            onChanged: (value) async {
                                              await FirebaseFirestore.instance
                                                  .collection('Cart')
                                                  .doc(data.docs[index].id)
                                                  .update({'checked': value});

                                              if (value == true) {
                                                setState(() {
                                                  id = data.docs[index]
                                                      ['businessid'];
                                                  itemids
                                                      .add(data.docs[index].id);
                                                  itemnames.add(
                                                      data.docs[index]['name']);
                                                  itemprices.add(int.parse(
                                                          data.docs[index]
                                                              ['price']) *
                                                      data.docs[index]['qty']);
                                                  itemqty.add(
                                                      data.docs[index]['qty']);
                                                  itemimg.add(
                                                      data.docs[index]['img']);
                                                });
                                              } else {
                                                setState(() {
                                                  id = data.docs[index]
                                                      ['businessid'];
                                                  itemids.remove(
                                                      data.docs[index].id);
                                                  itemnames.remove(
                                                      data.docs[index]['name']);
                                                  itemprices.remove(int.parse(
                                                          data.docs[index]
                                                              ['price']) *
                                                      data.docs[index]['qty']);
                                                  itemqty.remove(
                                                      data.docs[index]['qty']);
                                                  itemimg.remove(
                                                      data.docs[index]['img']);
                                                });
                                              }
                                            },
                                          )),
                                    );
                                  },
                                ),
                              );
                            }),
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
                                text: itemprices.isEmpty
                                    ? 'Total: ₱00.00'
                                    : 'Total: ₱${itemprices.reduce((value, element) => value + element)}.00',
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
                                    text: '${itemnames.length} items',
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
                                onPressed: () async {
                                  for (int i = 0; i < itemids.length; i++) {
                                    await FirebaseFirestore.instance
                                        .collection('Cart')
                                        .doc(itemids[i])
                                        .delete();
                                    addOrder(
                                        id,
                                        itemids[i],
                                        itemnames[i],
                                        itemprices[i],
                                        itemqty[i],
                                        itemimg[i],
                                        mydata['name']);
                                  }

                                  Navigator.pop(context);
                                  showToast('Checked out succesfully!');
                                },
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
        });
  }
}
