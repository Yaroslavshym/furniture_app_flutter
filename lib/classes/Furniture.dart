class Furniture {
  num price;
  num? newPrice;
  String title;
  String description;
  String imageName;
  num rating;
  Furniture(
      {required this.price,
      this.newPrice,
      required this.title,
      required this.description,
      required this.imageName,
      this.rating = 5.0});
}
