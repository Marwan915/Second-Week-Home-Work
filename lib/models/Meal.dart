class Meal {
  String? image;
  String? name;

  Meal({this.image, this.name});

  factory Meal.fromJson(Map json) {
    return Meal(
      image: json["strMealThumb"],
      name: json["strMeal"],
    );
  }
}
