import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mcakes/utlis/colors.dart';
import 'package:mcakes/widgets/text_widget.dart';
import 'package:mcakes/widgets/toast_widget.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          title: TextWidget(
            text: 'Admin Home Screen',
            fontSize: 18,
            fontFamily: 'Bold',
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(
                  text: 'Users',
                ),
                Tab(
                  text: 'Businesses',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Users')
                          .where('isVerified', isEqualTo: false)
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
                        return ListView.separated(
                            itemBuilder: (context, index) {
                              return const Divider();
                            },
                            separatorBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.account_circle_outlined,
                                    size: 50,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  TextWidget(
                                    text: data.docs[index]['name'],
                                    fontSize: 18,
                                    fontFamily: 'Bold',
                                  ),
                                  const SizedBox(
                                    width: 150,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await FirebaseFirestore.instance
                                          .collection('Users')
                                          .doc(data.docs[index].id)
                                          .update({
                                        'isVerified': true,
                                      });
                                      showToast('User verified!');
                                    },
                                    child: const Icon(
                                      Icons.check_box_outline_blank_outlined,
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: data.docs.length);
                      }),
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Business')
                          .where('isVerified', isEqualTo: false)
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
                        return ListView.separated(
                            itemBuilder: (context, index) {
                              return const Divider();
                            },
                            separatorBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.account_circle_outlined,
                                    size: 50,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  TextWidget(
                                    text: data.docs[index]['name'],
                                    fontSize: 18,
                                    fontFamily: 'Bold',
                                  ),
                                  const SizedBox(
                                    width: 150,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      await FirebaseFirestore.instance
                                          .collection('Business')
                                          .doc(data.docs[index].id)
                                          .update({
                                        'isVerified': true,
                                      });
                                      showToast('Business verified!');
                                    },
                                    child: const Icon(
                                      Icons.check_box_outline_blank_outlined,
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: data.docs.length);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
