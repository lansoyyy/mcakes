import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mcakes/services/add_order.dart';
import 'package:mcakes/widgets/textfield_widget.dart';
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

  int toadd = 0;

  String img = '';

  final refno = TextEditingController();
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
                                          trailing: StreamBuilder<
                                                  DocumentSnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection('Business')
                                                  .doc(data.docs[index]
                                                      ['businessid'])
                                                  .snapshots(),
                                              builder: (context,
                                                  AsyncSnapshot<
                                                          DocumentSnapshot>
                                                      snapshot) {
                                                if (!snapshot.hasData) {
                                                  return const SizedBox();
                                                } else if (snapshot.hasError) {
                                                  return const Center(
                                                      child: Text(
                                                          'Something went wrong'));
                                                } else if (snapshot
                                                        .connectionState ==
                                                    ConnectionState.waiting) {
                                                  return const SizedBox();
                                                }
                                                dynamic businessdata =
                                                    snapshot.data;
                                                img = businessdata['gcash'];
                                                return Checkbox(
                                                  value: data.docs[index]
                                                      ['checked'],
                                                  onChanged: (value) async {
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection('Cart')
                                                        .doc(
                                                            data.docs[index].id)
                                                        .update(
                                                            {'checked': value});

                                                    if (value == true) {
                                                      setState(() {
                                                        toadd += int.parse(
                                                            businessdata[
                                                                'deliveryfee']);
                                                        id = data.docs[index]
                                                            ['businessid'];
                                                        itemids.add(data
                                                            .docs[index].id);
                                                        itemnames.add(
                                                            data.docs[index]
                                                                ['name']);
                                                        itemprices.add(
                                                            int.parse(data.docs[
                                                                        index]
                                                                    ['price']) *
                                                                data.docs[index]
                                                                    ['qty']);
                                                        itemqty.add(
                                                            data.docs[index]
                                                                ['qty']);
                                                        itemimg.add(
                                                            data.docs[index]
                                                                ['img']);
                                                      });
                                                    } else {
                                                      setState(() {
                                                        toadd = toadd -
                                                            int.parse(businessdata[
                                                                'deliveryfee']);

                                                        id = data.docs[index]
                                                            ['businessid'];
                                                        itemids.remove(data
                                                            .docs[index].id);
                                                        itemnames.remove(
                                                            data.docs[index]
                                                                ['name']);
                                                        itemprices.remove(int
                                                                .parse(data.docs[
                                                                        index]
                                                                    ['price']) *
                                                            data.docs[index]
                                                                ['qty']);
                                                        itemqty.remove(
                                                            data.docs[index]
                                                                ['qty']);
                                                        itemimg.remove(
                                                            data.docs[index]
                                                                ['img']);
                                                      });
                                                    }
                                                  },
                                                );
                                              })),
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
                                    : 'Total: ₱${itemprices.reduce((value, element) => value + element) + toadd}.00',
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
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        child: SizedBox(
                                          width: 500,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextWidget(
                                                  text: 'Payment Method',
                                                  fontSize: 18,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (context) =>
                                                                AlertDialog(
                                                                  title:
                                                                      const Text(
                                                                    'GCash QR Code',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'QBold',
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  content:
                                                                      SizedBox(
                                                                    height: 250,
                                                                    width: 250,
                                                                    child: Image
                                                                        .network(
                                                                            img),
                                                                  ),
                                                                  actions: <Widget>[
                                                                    MaterialButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.of(context).pop(true),
                                                                      child:
                                                                          const Text(
                                                                        'Close',
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'QRegular',
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                    MaterialButton(
                                                                      onPressed:
                                                                          () async {
                                                                        Navigator.of(context)
                                                                            .pop();

                                                                        showDialog(
                                                                            context:
                                                                                context,
                                                                            builder: (context) =>
                                                                                AlertDialog(
                                                                                  title: const Text(
                                                                                    'Enter Reference Number',
                                                                                    style: TextStyle(fontFamily: 'QBold', fontWeight: FontWeight.bold),
                                                                                  ),
                                                                                  content: Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: [
                                                                                      TextFieldWidget(
                                                                                        controller: refno,
                                                                                        label: 'Reference Number',
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  actions: <Widget>[
                                                                                    MaterialButton(
                                                                                      onPressed: () => Navigator.of(context).pop(true),
                                                                                      child: const Text(
                                                                                        'Close',
                                                                                        style: TextStyle(fontFamily: 'QRegular', fontWeight: FontWeight.bold),
                                                                                      ),
                                                                                    ),
                                                                                    MaterialButton(
                                                                                      onPressed: () async {
                                                                                        for (int i = 0; i < itemids.length; i++) {
                                                                                          await FirebaseFirestore.instance.collection('Cart').doc(itemids[i]).delete();
                                                                                          addOrder(id, itemids[i], itemnames[i], itemprices[i] + toadd, itemqty[i], itemimg[i], mydata['name']);
                                                                                        }

                                                                                        Navigator.pop(context);
                                                                                        showToast('Checked out succesfully!');
                                                                                      },
                                                                                      child: const Text(
                                                                                        'Done',
                                                                                        style: TextStyle(fontFamily: 'QRegular', fontWeight: FontWeight.bold),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ));
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        'Done',
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'QRegular',
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ));
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      const Icon(
                                                        Icons.radio_button_off,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextWidget(
                                                        text: 'GCash',
                                                        fontSize: 14,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Divider(),
                                                GestureDetector(
                                                  onTap: () async {
                                                    for (int i = 0;
                                                        i < itemids.length;
                                                        i++) {
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection('Cart')
                                                          .doc(itemids[i])
                                                          .delete();
                                                      addOrder(
                                                          id,
                                                          itemids[i],
                                                          itemnames[i],
                                                          itemprices[i] + toadd,
                                                          itemqty[i],
                                                          itemimg[i],
                                                          mydata['name']);
                                                    }

                                                    Navigator.pop(context);
                                                    showToast(
                                                        'Checked out succesfully!');
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      const Icon(
                                                        Icons.radio_button_off,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      TextWidget(
                                                        text: 'Cash',
                                                        fontSize: 14,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
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
