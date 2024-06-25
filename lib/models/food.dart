class Food {
  String name;
  int calories;
  int quantity;
  String unitMeasurement;

  Food({
    required this.name,
    required this.calories,
    required this.quantity,
    required this.unitMeasurement,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      name: json["name"],
      calories: json["calories"],
      quantity: json["quantity"],
      unitMeasurement: json["unitMeasurement"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "calories": calories,
      "quantity": quantity,
      "unitMeasurement": unitMeasurement,
    };
  }
}
