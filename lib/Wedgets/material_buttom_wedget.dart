import 'package:flutter/material.dart';

class Material_buttom_wedget extends StatelessWidget {
  Material_buttom_wedget({super.key, required this.txt, this.ontap});

  final String txt;
  VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      color: Color(0xffF14052),
      height: 50,
      minWidth: double.infinity,
      onPressed: ontap,
      child: Text(
        txt,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
