import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mcakes/screens/auth/business_login_screen.dart';
import 'package:mcakes/services/add_user.dart';
import 'package:mcakes/widgets/text_widget.dart';
import 'package:mcakes/widgets/toast_widget.dart';

import '../../utlis/colors.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/textfield_widget.dart';
import '../home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final passwordController = TextEditingController();

  final emailController = TextEditingController();
  final newpasswordController = TextEditingController();

  final newemailController = TextEditingController();

  final name = TextEditingController();
  final number = TextEditingController();
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
                        label: 'Email: ', controller: newemailController),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldWidget(
                        isObscure: true,
                        label: 'Password: ',
                        controller: newpasswordController),
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const BusinessLoginPage()));
                        },
                        child: TextWidget(
                          text: 'Continue as a Store',
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
            width: 300,
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFieldWidget(
                    color: Colors.black,
                    controller: name,
                    label: 'Fullname',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    color: Colors.black,
                    controller: number,
                    label: 'Contact Number',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    color: Colors.black,
                    controller: emailController,
                    label: 'Email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget(
                    showEye: true,
                    isObscure: true,
                    color: Colors.black,
                    controller: passwordController,
                    label: 'Password',
                  ),
                  const SizedBox(
                    height: 50,
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
        );
      },
    );
  }

  register(context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      addUser(name.text, emailController.text, number.text);

      // signup(nameController.text, numberController.text, addressController.text,
      //     emailController.text);

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
          email: newemailController.text, password: newpasswordController.text);

      showToast('Logged in succesfully!');
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
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
