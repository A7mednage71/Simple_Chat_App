import 'package:chat_app_proj/Wedgets/chatbuble.dart';
import 'package:chat_app_proj/Wedgets/constants.dart';
import 'package:chat_app_proj/models/requistmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chat_page extends StatelessWidget {
  Chat_page({super.key});

  static String id = 'Beageh';

  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');

  TextEditingController controller = TextEditingController();

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy('time', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // print(snapshot.data!.docs[1]['nessage']);
            List<RequsetDataModel> messagelist = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagelist
                  .add(RequsetDataModel.fromjson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              backgroundColor: Color(0xffFFFFFF),
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Color(0xffF14052),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Klogo,
                      width: 50,
                      height: 50,
                    ),
                    Text('Chat'),
                  ],
                ),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagelist.length,
                      itemBuilder: (BuildContext, Index) {
                        return messagelist[Index].id == email
                            ? Chatbuble(
                                model: messagelist[Index],
                              )
                            : Chatbubleforfriend(model: messagelist[Index]);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          'nessage': data,
                          'time': DateTime.now(),
                          'id': email,
                        });
                        controller.clear();
                        _controller.animateTo(
                          0,
                          //_controller.position.maxScrollExtent,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 500),
                        );
                      },
                      decoration: InputDecoration(
                        hintText: 'Send Message',
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.send,
                              color: kPrimaryColor,
                            )),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Text('Loading...');
          }
        });
  }
}
