import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mcakes/utlis/colors.dart';

import '../widgets/text_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double initRating = 5;
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
          dynamic data = snapshot.data;
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
                                text: 'Name: ${data['name']}',
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              TextWidget(
                                text: 'Contact Number: ${data['number']}',
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              TextWidget(
                                text: 'Email: ${data['email']}',
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
                            StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('Orders')
                                    .where('uid',
                                        isEqualTo: FirebaseAuth
                                            .instance.currentUser!.uid)
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
                                  return SizedBox(
                                    width: 900,
                                    height: 500,
                                    child: GridView.builder(
                                      itemCount: data.docs.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 4),
                                      itemBuilder: (context, index) {
                                        return StreamBuilder<DocumentSnapshot>(
                                            stream: FirebaseFirestore.instance
                                                .collection('Business')
                                                .doc(data.docs[index]
                                                    ['businessid'])
                                                .snapshots(),
                                            builder: (context,
                                                AsyncSnapshot<DocumentSnapshot>
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
                                              dynamic data111 = snapshot.data;

                                              List rates = data111['raters'];
                                              return GestureDetector(
                                                onTap: () {
                                                  if (data.docs[index]
                                                          ['status'] ==
                                                      'Completed') {
                                                    if (!rates.contains(
                                                        FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid)) {
                                                      showDialog(
                                                          context: context,
                                                          builder:
                                                              (context) =>
                                                                  AlertDialog(
                                                                    title:
                                                                        const Text(
                                                                      'Rate Store',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'QBold',
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    content: StatefulBuilder(builder:
                                                                        (context,
                                                                            setState) {
                                                                      return RatingBar
                                                                          .builder(
                                                                        initialRating:
                                                                            initRating,
                                                                        minRating:
                                                                            1,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        allowHalfRating:
                                                                            true,
                                                                        itemCount:
                                                                            5,
                                                                        itemPadding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                4.0),
                                                                        itemBuilder:
                                                                            (context, _) =>
                                                                                const Icon(
                                                                          Icons
                                                                              .star,
                                                                          color:
                                                                              Colors.amber,
                                                                        ),
                                                                        onRatingUpdate:
                                                                            (rating) {
                                                                          setState(
                                                                              () {
                                                                            initRating =
                                                                                rating;
                                                                          });
                                                                        },
                                                                      );
                                                                    }),
                                                                    actions: <Widget>[
                                                                      MaterialButton(
                                                                        onPressed:
                                                                            () =>
                                                                                Navigator.of(context).pop(true),
                                                                        child:
                                                                            const Text(
                                                                          'Close',
                                                                          style: TextStyle(
                                                                              fontFamily: 'QRegular',
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                      MaterialButton(
                                                                        onPressed:
                                                                            () async {
                                                                          await FirebaseFirestore
                                                                              .instance
                                                                              .collection('Business')
                                                                              .doc(data.docs[index]['businessid'])
                                                                              .update({
                                                                            'star':
                                                                                FieldValue.increment(initRating),
                                                                            'raters':
                                                                                FieldValue.arrayUnion([
                                                                              FirebaseAuth.instance.currentUser!.uid
                                                                            ])
                                                                          });
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          'Rate',
                                                                          style: TextStyle(
                                                                              fontFamily: 'QRegular',
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ));
                                                    }
                                                  } else {
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (context) =>
                                                                AlertDialog(
                                                                  title:
                                                                      const Text(
                                                                    'Cancel Confirmation',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'QBold',
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  content:
                                                                      const Text(
                                                                    'Are you sure you want to cancel this order?',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'QRegular'),
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
                                                                        await FirebaseFirestore
                                                                            .instance
                                                                            .collection(
                                                                                'Orders')
                                                                            .doc(data
                                                                                .docs[
                                                                                    index]
                                                                                .id)
                                                                            .update({
                                                                          'status':
                                                                              'Cancelled'
                                                                        });
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        'Continue',
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'QRegular',
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ));
                                                  }
                                                },
                                                child: Card(
                                                  elevation: 5,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: double.infinity,
                                                        height: 125,
                                                        child: Image.network(
                                                            data.docs[index]
                                                                ['img']),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      TextWidget(
                                                        text: data.docs[index]
                                                                ['name'] +
                                                            ' ' +
                                                            data.docs[index]
                                                                    ['qty']
                                                                .toString(),
                                                        fontSize: 13,
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      TextWidget(
                                                        text:
                                                            '₱${data.docs[index]['price'] * data.docs[index]['qty']}.00',
                                                        fontSize: 16,
                                                        fontFamily: 'Bold',
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      TextWidget(
                                                        text: data.docs[index]
                                                            ['status'],
                                                        fontSize: 12,
                                                        fontFamily: 'Bold',
                                                        color: primary,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                    ),
                                  );
                                }),
                          ],
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
