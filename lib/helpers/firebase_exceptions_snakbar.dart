import 'package:flutter/material.dart';

void Showsnakbar(BuildContext context, String state) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state)));
}
