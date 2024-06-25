import 'package:nutri_edge/models/meal.dart';

class Diet {
  int? id;
  String? name;
  String? description;
  int? totalCalories;
  String? imageSrc;
  List<Meal>? meals;

  Diet({
    this.id,
    this.name,
    this.description,
    this.totalCalories,
    this.imageSrc = 'assets/diet-logos/arnold.png',
    this.meals,
  });

  Diet.jsonConstructor({
    required this.totalCalories,
    required this.meals,
    this.imageSrc = 'assets/diet-logos/arnold.png',
  });

  factory Diet.fromJson(Map<String, dynamic> json) {
    return Diet.jsonConstructor(
      totalCalories: json["totalCalories"],
      meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "totalCalories": totalCalories,
      "meals": List<dynamic>.from(meals!.map((x) => x.toJson())),
    };
  }
}
