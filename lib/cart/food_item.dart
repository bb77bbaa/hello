import 'package:flutter/foundation.dart';
import 'package:test_error/Database/Transaction_db.dart';

FooditemList fooditemList = FooditemList(foodItems:[FoodItem(
  id: 1,
  title: "ทัวร์น่าน ม๋วนใจ",
  hotel: "ดอยเสมอดาว",
  hotel2: "3 วัน 2 คืน",
  price: 3000,
  imgUrl:
  "https://cms.dmpcdn.com/travel/2020/02/24/9ddb1a30-56db-11ea-b3d8-ab89704a9bb5_original.JPG",
),
  FoodItem(
    id: 2,
    title: "มหานคร สกายวอล์ค",
    hotel: "Dudleys",
    hotel2: "อาหาร 6 มื้อ โรงเเรม 3 ดาว",
    price: 2999,
    imgUrl:
    "https://cms.dmpcdn.com/travel/2020/02/24/1a8948e0-56dc-11ea-8ded-c572ddfbb31d_original.JPG",
  ),
  FoodItem(
    id: 3,
    title: "ตลาดน้ำขวัญเรียม",
    hotel: "Golf Course",
    hotel2: "อาหาร 6 มื้อ โรงเเรม 3 ดาว",
    price: 1999,
    imgUrl: "https://cms.dmpcdn.com/travel/2020/02/24/8ef6e340-56dc-11ea-8ded-c572ddfbb31d_original.JPG",
  ),

]);

class FooditemList {
  List<FoodItem> foodItems;
  FooditemList({@required this.foodItems});
}

class FoodItem {
  int id;
  String title;
  String hotel;
  String hotel2;
  double price;
  String imgUrl;
  int quantity;

  FoodItem({
    @required this.id,
    @required this.title,
    @required this.hotel,
    @required this.hotel2,
    @required this.price,
    @required this.imgUrl,
    this.quantity = 1,
  });
  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }
  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}
