class Catagories {
  String? id;
  String? name;
  String? image;
  String? Description;

  Catagories({this.id, this.name, this.image, this.Description});

  factory Catagories.fromJson(Map json) {
    return Catagories(
        id: json["idCategory"],
        name: json["strCategory"],
        image: json["strCategoryThumb"],
        Description: json["strCategoryDescription"]);
  }
}
