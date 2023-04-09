// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class chatBot extends StatelessWidget {
  const chatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // try {
        //   dynamic conversationObject = {
        //     'appId':
        //         'fdd24b2dc4b08dbd63ad715288f68604' // The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
        //   };
        //   dynamic result = await KommunicateFlutterPlugin.buildConversation(
        //       conversationObject);
        //   print("Conversation builder success : " + result.toString());
        // } on Exception catch (e) {
        //   print("Conversation builder error occurred : " + e.toString());
        // }
      },
      style: ElevatedButton.styleFrom(
          minimumSize: Size(40, 50),
          backgroundColor: Color(0xff19376D),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      child: Icon(
        Icons.chat_bubble,
        color: Color(0xffA5D7E8),
      ),
    );
  }
}
