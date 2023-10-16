import 'package:flutter/material.dart';

class TexTField extends StatelessWidget {
  TexTField(
      {super.key,
      required this.hint,
      this.word,
      required this.obsurre,
      required this.icon});

  final String hint;
  Function(String)? word;
  bool obsurre;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsurre,
      validator: (value) {
        if (value!.isEmpty) {
          return 'field is requird';
        }
      },
      onChanged: word,
      decoration: InputDecoration(
          prefixIcon: icon,
          prefixIconColor: Color(0xffF14052),
          hintText: hint,
          hintStyle: const TextStyle(color: Color(0xffF14052)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffF14052))),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffF14052)),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffF14052)))),
    );
  }
}
