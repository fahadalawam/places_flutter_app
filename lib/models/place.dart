class Place {
  int id;
  String name;
  List<String> images;
  double price;
  double rating;
  bool isLiked;

  Place({
    required this.id,
    required this.name,
    required this.images,
    required this.price,
    required this.rating,
    this.isLiked = false,
  });
}
