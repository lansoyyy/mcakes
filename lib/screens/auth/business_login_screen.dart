import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:mcakes/screens/business/business_home_screen.dart';
import 'package:mcakes/services/add_business.dart';
import 'package:mcakes/widgets/text_widget.dart';
import 'package:mcakes/widgets/toast_widget.dart';
import 'dart:html';
import '../../utlis/colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/textfield_widget.dart';
import '../home_screen.dart';

class BusinessLoginPage extends StatefulWidget {
  const BusinessLoginPage({super.key});

  @override
  State<BusinessLoginPage> createState() => _BusinessLoginPageState();
}

class _BusinessLoginPageState extends State<BusinessLoginPage> {
  final password = TextEditingController();

  final email = TextEditingController();
  final newpassword = TextEditingController();

  final newemail = TextEditingController();

  final name = TextEditingController();
  final desc = TextEditingController();
  final caption = TextEditingController();
  final opening = TextEditingController();
  final closing = TextEditingController();
  final deliveryfee = TextEditingController();
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

  late String? imgUrl1 = '';

  uploadToStorage1() {
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
          imgUrl1 = downloadUrl;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 75,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'MCakes',
                      fontSize: 75,
                      color: primary,
                      fontFamily: 'Bold',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 450,
                      width: 600,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/david-holifield-kPxsqUGneXQ-unsplash.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'LOGIN',
                      fontSize: 24,
                      color: Colors.black,
                      fontFamily: 'Bold',
                    ),
                    TextWidget(
                        text: 'Welcome back! Please enter your details',
                        fontSize: 16,
                        color: Colors.black),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        label: 'Business Email: ', controller: newemail),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        isObscure: true,
                        label: 'Password: ',
                        controller: newpassword),
                    // TextButton(
                    //     onPressed: (() {}),
                    //     child: TextBold(
                    //         text: 'Forgot Password?',
                    //         fontSize: 12,
                    //         color: Colors.black)),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ButtonWidget(
                          color: primary,
                          label: 'Login',
                          onPressed: (() async {
                            login(context);
                          })),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            text: "Don't have an account?",
                            fontSize: 12,
                          ),
                          TextButton(
                            onPressed: () {
                              createAccountDialog();
                            },
                            child: TextWidget(
                              text: 'Create one',
                              fontSize: 13,
                              fontFamily: 'Bold',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: TextWidget(
                          text: 'Continue as User',
                          fontSize: 13,
                          fontFamily: 'Bold',
                          color: primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Expanded(child: SizedBox()),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 400, right: 400, bottom: 20),
                child: TextWidget(
                    text:
                        'Republic Act No. 10173, otherwise known as the Data Privacy Act is a law that seeks to protect all forms of information, be it private, personal, or sensitive. It is meant to cover both natural and juridical persons involved in the processing of personal information.',
                    fontSize: 12,
                    color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }

  createAccountDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            width: 350,
            height: 600,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
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
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextWidget(
                            text: 'Upload logo',
                            fontSize: 14,
                            fontFamily: 'Bold',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        //Image? fromPicker =
                        //     await ImagePickerWeb.getImageAsWidget();
                        uploadToStorage1();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                          child: TextWidget(
                            text: 'Upload Permit',
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
                      color: Colors.black,
                      controller: name,
                      label: 'Store Name',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      color: Colors.black,
                      controller: desc,
                      label: 'Store Description',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      color: Colors.black,
                      controller: caption,
                      label: 'Store Caption',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      color: Colors.black,
                      controller: opening,
                      label: 'Opening Time',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      color: Colors.black,
                      controller: closing,
                      label: 'Closing Time',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      color: Colors.black,
                      controller: deliveryfee,
                      label: 'Delivery Fee',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      color: Colors.black,
                      controller: email,
                      label: 'Business Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFieldWidget(
                      showEye: true,
                      isObscure: true,
                      color: Colors.black,
                      controller: password,
                      label: 'Password',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: ButtonWidget(
                          color: primary,
                          label: 'Create',
                          onPressed: (() async {
                            register(context);
                          })),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  register(context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      // signup(nameController.text, numberController.text, addressController.text,
      //     emailController.text);

      addBusiness(name.text, caption.text, desc.text, opening.text,
          closing.text, deliveryfee.text, imgUrl, imgUrl1);

      showToast("Registered Successfully!");

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showToast('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        showToast('The email address is not valid.');
      } else {
        showToast(e.toString());
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }

  login(context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: newemail.text, password: newpassword.text);

      showToast('Logged in succesfully!');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const BusinessHomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast("No user found with that email.");
      } else if (e.code == 'wrong-password') {
        showToast("Wrong password provided for that user.");
      } else if (e.code == 'invalid-email') {
        showToast("Invalid email provided.");
      } else if (e.code == 'user-disabled') {
        showToast("User account has been disabled.");
      } else {
        showToast("An error occurred: ${e.message}");
      }
    } on Exception catch (e) {
      showToast("An error occurred: $e");
    }
  }
}
