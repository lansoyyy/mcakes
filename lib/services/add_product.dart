import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addProduct(name, price, img) async {
  final docUser = FirebaseFirestore.instance.collection('Products').doc();

  final json = {
    'name': name,
    'price': price,
    'img': img,
    'qty': 0,
    'id': docUser.id,
    'uid': FirebaseAuth.instance.currentUser!.uid,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
}
