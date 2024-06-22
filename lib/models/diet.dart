import 'package:nutri_edge/models/meal.dart';

class Diet{
  int? id;
  String name;
  String description;
  int totalCalories;
  String imageSrc;
  List<Meal> meals;

  Diet({this.id, required this.name, required this.description, required this.totalCalories, required this.imageSrc, required this.meals});
}