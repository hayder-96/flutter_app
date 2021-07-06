class ModelClothes {

  final String name;
  final String image;

  ModelClothes({required this.name, required this.image});


  factory ModelClothes.fromJson(Map<String, dynamic> json) {
    return ModelClothes(
      name: json['name'],
      image: json['image'],

    );
  }
}