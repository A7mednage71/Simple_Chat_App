import 'package:chat_app_proj/firebase_options.dart';
import 'package:chat_app_proj/pages/Login_page.dart';
import 'package:chat_app_proj/pages/Sign_page.dart';
import 'package:chat_app_proj/pages/chat_page.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Chat_app());
}

class Chat_app extends StatelessWidget {
  const Chat_app({super.key});

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: { 
        Login_page.id: (context) => Login_page(),
        Chat_page.id: (context) => Chat_page(),
        Sign_page.id: (context) => Sign_page(),

      },
      // routes: {
      //   'Login_page':(context) => const Login_page(),
      //   'Sign_page' :(context) =>  Sign_page(),
      // },
      // initialRoute: 'Login_page',
      //home:  Login_page(),
      home: Sign_page(),
    );
  }
}
