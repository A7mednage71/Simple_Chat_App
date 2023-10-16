import 'package:chat_app_proj/models/requistmodel.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class Chatbuble extends StatelessWidget {
  const Chatbuble({
    super.key,
    required this.model,
  });

  final RequsetDataModel model;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, right: 16, left: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: kPrimaryColor,
        ),
        child: Text(
          model.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class Chatbubleforfriend extends StatelessWidget {
  const Chatbubleforfriend({
    super.key,
    required this.model,
  });

  final RequsetDataModel model;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.all(16),
        padding:
            const EdgeInsets.only(top: 16, bottom: 16, right: 16, left: 16),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          color: Color(0xff3F964F),
        ),
        child: Text(
          model.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
