import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addOrder(businessid, productid, name, price, qty, img) async {
  final docUser = FirebaseFirestore.instance.collection('Orders').doc();

  final json = {
    'name': name,
    'price': price,
    'qty': qty,
    'img': img,
    'productid': productid,
    'businessid': businessid,
    'id': docUser.id,
    'uid': FirebaseAuth.instance.currentUser!.uid,
    'dateTime': DateTime.now(),
    'status': 'Pending'
  };

  await docUser.set(json);
}
