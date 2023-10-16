import 'package:chat_app_proj/Wedgets/constants.dart';
import 'package:chat_app_proj/Wedgets/material_buttom_wedget.dart';
import 'package:chat_app_proj/Wedgets/textfield_wedg.dart';
import 'package:chat_app_proj/helpers/firebase_exceptions_snakbar.dart';
import 'package:chat_app_proj/pages/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login_page extends StatelessWidget {
  Login_page({super.key});

  static String id = 'Benageh';

  String? email, password;
  GlobalKey<FormState> keyform = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: keyform,
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
                  'Login now to see what they are talking !',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                Center(child: Image.asset('assets/images/2650149.jpg')),
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
                    if (keyform.currentState!.validate()) {
                      try {
                        await LoginUser();
                        Showsnakbar(context, 'Success');
                        Navigator.pushNamed(context, Chat_page.id,
                            arguments: email);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          Showsnakbar(context, 'user not found');
                        } else if (e.code == 'wrong-password') {
                          Showsnakbar(context, 'wrong password');
                        }
                      } catch (e) {
                        Showsnakbar(context, 'there was an error');
                      }
                    } else {}
                  },
                  txt: 'Login',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account ?",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Register here',
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
    );
  }

  Future<void> LoginUser() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
