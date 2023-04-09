// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(4, 10, 0, 0),
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Do something when the left icon button is pressed
            },
          ),
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text('Edit Profile'),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text('Logout'),
                  value: 2,
                ),
              ];
            },
            onSelected: (value) {
              // Do something when an option is selected
              switch (value) {
                case 1:
                  // Do something for option 1
                  break;
                case 2:
                  // Do something for option 2
                  break;
                case 3:
                  // Do something for option 3
                  break;
              }
            },
          ),
        ],
        backgroundColor: Color(0xff0B2447),
        toolbarHeight: 100,
        title: const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Text('Your Profile', style: TextStyle(fontSize: 20)),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
            child: Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('images/fitnessModel.png'),
              ),
            ),
          ),
          Text('First Last',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SourceSansPro')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 30),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    child: Text('Timeline',style: TextStyle(fontSize: 20),),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    onLongPress: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                    ),
                    child: Text('Stats',style: TextStyle(fontSize: 20),),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
