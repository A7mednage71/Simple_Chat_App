import 'package:chat_app_proj/Wedgets/constants.dart';
import 'package:chat_app_proj/Wedgets/material_buttom_wedget.dart';
import 'package:chat_app_proj/Wedgets/textfield_wedg.dart';
import 'package:chat_app_proj/helpers/firebase_exceptions_snakbar.dart';
import 'package:chat_app_proj/pages/Login_page.dart';
import 'package:chat_app_proj/pages/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Sign_page extends StatefulWidget {
  Sign_page({super.key});

  static String id = 'Bennageh';

  @override
  State<Sign_page> createState() => _Sign_pageState();
}

class _Sign_pageState extends State<Sign_page> {
  String? email;
  String? Fullname;
  String? password;

  bool isloading = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Whats App',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Text(
                    'Create Your account now to chat',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(child: Image.asset('assets/images/6520.jpg')),
                  const SizedBox(
                    height: 25,
                  ),
                  TexTField(
                    icon: Icon(Icons.person),
                    obsurre: false,
                    word: (data) {
                      Fullname = data;
                    },
                    hint: 'Username',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TexTField(
                    icon: Icon(Icons.email),
                    obsurre: false,
                    word: (data) {
                      email = data;
                    },
                    hint: 'Email',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TexTField(
                    icon: Icon(Icons.lock),
                    obsurre: true,
                    word: (data) {
                      password = data;
                    },
                    hint: 'Password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material_buttom_wedget(
                    ontap: () async {
                      isloading = true;
                      setState(() {});
                      if (formkey.currentState!.validate()) {
                        isloading = true;
                        try {
                          await RegisterUser();
                          Navigator.pushNamed(context, Chat_page.id,
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            Showsnakbar(
                                context, 'The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            Showsnakbar(context,
                                'The account already exists for that email.');
                          }
                        } catch (e) {
                          Showsnakbar(context, 'there was an error');
                        }

                        isloading = false;
                        setState(() {});
                      } else {}
                    },
                    txt: 'Register',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account ?",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Login_page.id);
                        },
                        child: const Text(
                          'Login now',
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names

  Future<void> RegisterUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
