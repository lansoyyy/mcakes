import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addBusiness(
    name, caption, desc, opening, closing, deliveryfee, img) async {
  final docUser = FirebaseFirestore.instance
      .collection('Business')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  final json = {
    'name': name,
    'caption': caption,
    'desc': desc,
    'opening': opening,
    'closing': closing,
    'deliveryfee': deliveryfee,
    'id': docUser.id,
    'img': img,
    'type': 'Business'
  };

  await docUser.set(json);
}
