
import 'package:flutter/foundation.dart';
import 'package:test_error/Database/Transaction_db.dart';
import 'package:test_error/Models/Trans.dart';
import 'package:sembast/sembast.dart';

class providertrans with ChangeNotifier {
 List<Trans> trans = [];
 List<Trans> getTrans(){
   return trans;
 }


 void initData() async{
   var db = TransactionDB(dbName:"transactions.db");
   trans = await db.loadAlldata2();
   notifyListeners();
 }
 void addTrans(Trans statement) async{
 // var db = await TransactionDB(dbName:"transaction.db").openDatabase();
   var db = TransactionDB(dbName:"transactions.db");
   await db.Insertdata(statement);
  trans = await db.loadAlldata2();
   // call consumer
   notifyListeners();
 }

}
