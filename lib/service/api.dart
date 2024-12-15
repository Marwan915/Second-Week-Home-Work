import 'package:flutter_food_app/data/global_data.dart';
import 'package:flutter_food_app/models/Catagories.dart';
import 'package:flutter_food_app/models/Meal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  Future<List<Catagories>> getData() async {
    String link = "https://www.themealdb.com/api/json/v1/1/categories.php";
    var uri = Uri.parse(link);
    var response = await http.get(uri);

    var responseJson = json.decode(response.body);

    for (var element in responseJson["categories"]) {
      allcatagories.add(Catagories.fromJson(element));
    }
    return allcatagories;
    // print(allcatagories.length);
  }

  Future<List<Meal>> getMeals(String category) async {
    String mealsLink = "https://www.themealdb.com/api/json/v1/1/filter.php?c=";
    if (category == "Pork") {
      print("حرام");
    }
    var uri = Uri.parse(mealsLink + category);
    var response = await http.get(uri);
    var responseJson = json.decode(response.body);
    List<Meal> meals = [];
    for (var element in responseJson["meals"]) {
      meals.add(Meal.fromJson(element));
    }
    return meals;
  }
}
