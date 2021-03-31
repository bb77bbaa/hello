
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_error/cart/themeColor.dart';
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
      color: Colors.indigo.shade600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(height: 0, width: 0,
                ),
                Text('Account', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                Container(height: 0,width: 0)
              ],
            ),
          ),
         Padding(
            padding: const EdgeInsets.only(top:0.0),
            child: getProfileImage(),
            /*child: ClipOval(child: Image.network('https://cdn.pixabay.com/photo/2014/04/02/10/48/symbol-304598_960_720.png',
              height: 140, width: 140, fit: BoxFit.cover,),),*/
          ),
    //buildCircleAvatar(),
          Padding(
              padding: const EdgeInsets.only(bottom: 0.0), ),
          SizedBox(height: 8),
TextField(
  decoration: InputDecoration(
    labelText: "     User Name",
    labelStyle: TextStyle(
      fontSize: 20,fontWeight: FontWeight.bold,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintText: '     Name: ' + user.displayName,
    hintStyle: TextStyle(
      fontSize: 16,fontWeight: FontWeight.bold,
      color: Colors.white,
    )
  ),
),
          TextField(
            decoration: InputDecoration(
                labelText: "     E-mail",
                labelStyle: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.bold,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: '     Email: ' + user.email,
                hintStyle: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
            ),
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "     Password",
                labelStyle: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.bold,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "     ********",
                hintStyle: TextStyle(
                  fontSize: 16,fontWeight: FontWeight.bold,
                  color: Colors.white,
                )
            ),
          ),
          //TextField(
          //  decoration: InputDecoration(
              //  labelText: "     Bookink",
             //   labelStyle: TextStyle(
              //    fontSize: 20,fontWeight: FontWeight.bold,

             //   ),
              //  floatingLabelBehavior: FloatingLabelBehavior.always,
             //   hintText: "     ข้อมูลจองทัวร์",
            //    hintStyle: TextStyle(
             //     fontSize: 16,fontWeight: FontWeight.bold,
             //     color: Colors.white,
            //    )
          //  ),
        //    readOnly: true,
       //   ),
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
            //fillColor: Colors.blue[900],
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

