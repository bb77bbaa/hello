import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_error/Models/Trans.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';


class TransactionDB{
  final user = FirebaseAuth.instance.currentUser;
  String dbName;

  TransactionDB({this.dbName});

  Future<Database> openDatabase() async{

    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path,dbName);
    //create database
    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;

  }
  // savedata
  Future<int> Insertdata(Trans statement) async{
    //data => Store
    // transaction.db => expense
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");

    var keyID=store.add(db,{
      "firstname" :statement.firstname,//ชื่อทัวร์
      "number" :statement.number,
      "phone" :statement.phone,
      "travel" : 1 ,
      "start":statement.start,
      "end":statement.end,
      "package":statement.package,
     "price":statement.price,
      "email":statement.email,
    });

    return  keyID;
  }

  //load data
  Future<List<Trans>>loadAlldata() async{
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db);
    print(snapshot);
    List transactionList = List<Trans>();
    for (var record in snapshot){
      transactionList.add(
          Trans(firstname: record["firstname"],
              number: record["number"],
              phone: record["phone"],
              travel:record["travel"],
              start: record['start'],
              end: record['end'],
              package: record['package'],
              price: record['price'],
              email:record['email'],
          )
      );
    }
  //  store.delete(db);
    return transactionList;
  }
  Future<List<Trans>>loadAlldata2() async{
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    final finder = Finder(filter: Filter.equals('email',user.email.toString()));
    var snapshot = await store.find(db,finder: finder);
    List transactionList = List<Trans>();
    for (var record in snapshot){
      transactionList.add(
          Trans(firstname: record["firstname"],
            number: record["number"],
            phone: record["phone"],
            travel:record["travel"],
            start: record['start'],
            end: record['end'],
            package: record['package'],
            price: record['price'],
            email:record['email'],
          )
      );
    }
    print(snapshot);
  // store.delete(db);
    return transactionList;
  }


}