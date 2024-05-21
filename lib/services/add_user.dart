import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addUser(name, email, number) async {
  final docUser = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  final json = {
    'name': name,
    'number': number,
    'email': email,
    'id': docUser.id,
    'isVerified': false,
  };

  await docUser.set(json);
}
