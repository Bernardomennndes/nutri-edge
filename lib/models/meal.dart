import 'package:nutri_edge/models/food.dart';

class Meal {
  int? id;
  String name;
  int calories;
  List<Food> foods;
  
  Meal({this.id, required this.name, required this.calories, required this.foods});
}