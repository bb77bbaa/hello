import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_error/Models/Trans.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:test_error/Provider/provider.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:test_error/cart/food_item.dart';



class FormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final firstnameController = TextEditingController();
  final numberController = TextEditingController();
  final phoneController = TextEditingController();
  final startController = TextEditingController();
  final endController = TextEditingController();
  final packageController = TextEditingController();
  final dateFormat = DateFormat("dd/MM/yyyy");
  final user = FirebaseAuth.instance.currentUser;
  DateTime date;
  TimeOfDay time;

final FoodItem foodItem;

 FormScreen({Key key, this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Colors.lightBlue[200],
        appBar: AppBar(
          title: Text("แบบฟอร์ม"),
          backgroundColor:Colors.blue[900],
        ),
        body: Form(
          key: formKey,
          child:Padding(
            padding: const EdgeInsets.all(9.0),
            child: SingleChildScrollView(
              child: Container(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  TextFormField(
                    decoration: new InputDecoration(labelText: "ชื่อ", enabledBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),

                      labelStyle: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    autofocus: true,
                    controller: firstnameController,
                    validator: (String str) {
                      if (str.isEmpty) {
                        return "input name";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(labelText: "จำนวนคน",enabledBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),

                      labelStyle: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    autofocus: true,
                    controller: numberController,
                    validator: (String str) {
                      if (str.isEmpty) {
                        return "input number";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: new InputDecoration(labelText: "phone",enabledBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
            focusedBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
            ),

            labelStyle: TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
                    autofocus: true,
                    controller: phoneController,
                    validator: (String str) {
                      if (str.isEmpty) {
                        return "input phone";
                      }
                      return null;
                    },
                  ),
                  DateTimeField(
                    format: dateFormat,
                    decoration: new InputDecoration(labelText: "เดินทาง",enabledBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
            focusedBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
            ),

            labelStyle: TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
                    autofocus: true,
                    controller: startController,
                    validator: (date) => date == null ? 'Invalid date' : null,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    },
                  ),

                  DateTimeField(
                    format: dateFormat,
                    decoration: new InputDecoration(labelText: "กลับ",enabledBorder:OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white, width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                      focusedBorder:OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),

                      labelStyle: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    autofocus: true,
                    controller: endController,
                    validator: (date) => date == null ? 'Invalid date' : null,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    },
                  ),

                  TextField(
                    decoration: new InputDecoration(labelText: "Package" ,hintText:foodItem.title,enabledBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
            focusedBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
            ),

            labelStyle: TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
                   controller: packageController,
                    autofocus: true,
                readOnly: true,

                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(alignment: Alignment.center,
                      child: FlatButton(
                        child: Text("จอง"),

                        color: Colors.red,
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            if (user.email != null) {
                              var first = firstnameController.text;
                              var last = numberController.text;
                              var phone = phoneController.text;
                              var startdate = startController.text;
                              var enddate = endController.text;
                              var package = foodItem.title.toString();
                              var price = foodItem.price.toDouble();
                              var email = user.email.toString();

                              // prepare data
                              Trans statement = Trans(
                                firstname: first,
                                number: last,
                                phone: phone,
                                travel: 1,
                                start: startdate,
                                end: enddate,
                                package: package,
                                price: price,
                                email: email,
                              );
                              // call provider
                              var provider =
                              Provider.of<providertrans>(
                                  context, listen: false);
                              provider.addTrans(statement);
                              Navigator.pop(context);
                            }
                            else{
                              print("null");
                            }
                          }

                        },
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ));
  }
}
