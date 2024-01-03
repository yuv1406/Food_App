import 'package:flutter/cupertino.dart';

import 'food.dart';

class Shop with ChangeNotifier{
  final List<Food> _foodMenu = [
    Food(
        name: "Veg Shwarma",
        price:"100",
        imagePath: "lib/images/kebab.png",
        rating: "4.2"
    ),
    Food(
        name: "Chicken Shwarma",
        price:"150",
        imagePath: "lib/images/shawarma1.png",
        rating: "4.8"
    ),
    Food(
        name: "Shwarma Brota",
        price:"160",
        imagePath: "lib/images/taco.png",
        rating: "4.2"
    ),
    Food(
        name: "Shwarma Burger",
        price:"120",
        imagePath: "lib/images/burger.png",
        rating: "4.2"
    ),
  ];

  List <Food> _cart = [];

  //getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addTocart(Food foodItem, int count){
    for(int i = 0; i< count; i++){
      _cart.add(foodItem);
    }
    notifyListeners();
  }
  void removeFromcart(Food food){
    _cart.remove(food);
    notifyListeners();
  }

}