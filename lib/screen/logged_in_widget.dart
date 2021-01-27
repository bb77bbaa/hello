
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_error/screen/AccountView.dart';
import 'AccountView.dart';
import 'Loginscreen.dart';



class LoggedInWidget extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  FirebaseAuth auth = FirebaseAuth.instance;
  signOut() async {
    await auth.signOut();
  }
  @override
  Widget build(BuildContext context) {


    return Container(
      alignment: Alignment.center,
      color: Colors.blueGrey.shade900,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Logged In',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: getProfileImage(),
          ),
          //buildCircleAvatar(),
          SizedBox(height: 8),
          Text(
            'Name: ' + user.displayName,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'Email: ' + user.email,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()
                  ));
            },
            child: Text('Logout'),
          ),
          RawMaterialButton(
            onPressed: (){

              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AccountView()
                  ));

            },
            fillColor: Colors.blue[900],
            child: Text('ดูข้อมูลจอง', style: TextStyle(color: Colors.white,fontSize: 20)),
          ),
        ],
      ),
    );

  }

  getProfileImage() {
    final user = FirebaseAuth.instance.currentUser;
    if(user.photoURL != null) {
      return Image.network(user.photoURL, height: 100, width: 100);
    } else {
      return Icon(Icons.account_circle, size: 100);
    }

  }

  Widget buildCircleAvatar() {
    final user = FirebaseAuth.instance.currentUser;
    return Container(
      child: CircleAvatar(
        foregroundColor: Colors.deepOrange,
        maxRadius: 40,
        backgroundColor: Colors.blue,
        backgroundImage: NetworkImage(user.photoURL),
      ),
    );
  }

  void buildProfile(user) {
    final user = FirebaseAuth.instance.currentUser;
    if(user.photoURL != null){
      CircleAvatar(
        maxRadius: 40,
        backgroundColor: Colors.blue,
        backgroundImage: NetworkImage(user.photoURL),
      );
    } else {
      CircleAvatar(
        maxRadius: 40,
        backgroundColor: Colors.blue,
      );
    }
  }

  /*getProfileImage(){
    if (user.currentUser.photoURL != null) {
      return Image.network(_auth.currentUser.photoURL, height: 100, width: 100);
    } else {
      return Icon(Icons.account_circle, size: 100);
    }
  }*/


}
