import 'package:nutri_edge/models/food.dart';

class Meal {
  String name;
  int calories;
  List<Food> foods;

  Meal({
    required this.name,
    required this.calories,
    required this.foods,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      name: json["name"],
      calories: json["calories"],
      foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "calories": calories,
      "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
    };
  }
}
