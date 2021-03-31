import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test_error/Models/Trans.dart';
import 'package:test_error/Provider/provider.dart';
import 'package:test_error/screen/MyBottomNavigationBar.dart';

class ViewData extends StatefulWidget {



  final int k;
  ViewData({Key key, @required this.k}) : super(key: key);





@override
  _ViewDataState createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {

  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<providertrans>(context,listen:false).initData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text("travel app"),

          leading:
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyBottomNavigationBar(),));

            },
          ),


        ),

        body: Consumer(builder: (context, providertrans provider, Widget child) {
          int ok = widget.k;
          int r = 0;
          return ListView.builder(
              itemCount: provider.trans.length,
              itemBuilder: (context,int ok) {
                Trans data = provider.trans[ok];
                return Card(
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(radius: 30,
                      child: FittedBox(
                        child: Text(data.price.toString()),
                      ),
                    ),
                    title: Text(data.package.toString()),
                    subtitle: Text("จำนวน "+data.number+" คน"),
                    trailing:  GestureDetector(
                      //onTap: ()=>print("Test"),
                      onTap: (){
           print(widget.k);
                      },
                      child: Text("More",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0,
                        ),
                      ),
                    ),

                  ),
                );

              });
        })

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
