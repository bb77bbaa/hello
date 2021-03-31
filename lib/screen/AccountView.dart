
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_error/Models/Trans.dart';
import 'package:test_error/Provider/provider.dart';
import 'package:test_error/screen/MyBottomNavigationBar.dart';
import 'package:test_error/screen/ViewData.dart';

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();

}

class _AccountViewState extends State<AccountView> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<providertrans>(context,listen:false).initData();
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
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

          return ListView.builder(
              itemCount: provider.trans.length,
              itemBuilder: (context, int index) {
                Trans data = provider.trans[index];
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
                    trailing: Text(data.start) ,

                  ),
                );

              });
        })

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
