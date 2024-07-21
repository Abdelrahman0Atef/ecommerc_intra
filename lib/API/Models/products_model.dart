class ProductsModel {
  late final int productId;
  late final String name;
  late final String description;
  late final double price;
  late final String unit;
  late final String image;
  late final int discount;
  late final bool availability;
  late final String brand;
  late final String category;
  late final double rating;
  final List<Reviews>? reviews;

  ProductsModel({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.unit,
    required this.image,
    required this.discount,
    required this.availability,
    required this.brand,
    required this.category,
    required this.rating,
    required this.reviews,
  });

  factory ProductsModel.fromJson(jsonData) {
    return ProductsModel(
        productId: jsonData['product_id'],
        name: jsonData['name'],
        description: jsonData['description'],
        price: jsonData['price'],
        unit: jsonData['unit'],
        image: jsonData['image'],
        discount: jsonData['discount'],
        availability: jsonData['availability'],
        brand: jsonData['brand'],
        category: jsonData['category'],
        rating: jsonData['rating'],
        reviews: jsonData['reviews'] == null
            ? null
            : (jsonData['reviews'] as List)
                .map((e) => Reviews.fromJson(e))
                .toList());
  }
}

class Reviews {
  late final int userId;
  late final int rating;
  late final String comment;

  Reviews({required this.userId, required this.rating, required this.comment});

  factory Reviews.fromJson(jsonData) {
    return Reviews(
      userId: jsonData['user_id'],
      rating: jsonData['rating'],
      comment: jsonData['comment'],
    );
  }
}
