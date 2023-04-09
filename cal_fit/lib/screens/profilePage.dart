import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffff),
        toolbarHeight: 100,
        title: Text('Your Profile',style: TextStyle(color: Color(0xff0B2447)),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
    );
  }
}