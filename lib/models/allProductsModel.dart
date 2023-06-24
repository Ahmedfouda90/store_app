class ProductsModel {
  final dynamic id;
  final String image;
  final String title;
  final String category;
  final String description;
  final dynamic price;
  final RatingModel? rating;

  ProductsModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.image,
      required this.category,
      required this.description,
      required this.rating});

  factory ProductsModel.fromJson(jsonData) {
    return ProductsModel(
        id: jsonData['id'],
        price: jsonData['price'],
        image: jsonData['image'],
        category: jsonData['category'],
        title: jsonData['title'],
        description: jsonData['description'],
        rating: jsonData['rating'] == null
            ? null
            : RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel {
  final dynamic rate;
  final int count;

  RatingModel({required this.count, required this.rate});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(count: jsonData['count'], rate: jsonData['rate']);
  }
}

