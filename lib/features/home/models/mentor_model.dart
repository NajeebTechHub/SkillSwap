class MentorModel {
  final String id;
  final String name;
  final String role;
  final int reviews;
  final int price;
  final double rating;
  final String image;
  final String category;
  final bool featured;

  MentorModel(
      {required this.id, required this.name, required this.role, required this.reviews, required this.price, required this.rating, required this.image, required this.category, required this.featured});

  MentorModel copyWith({
    String? id,
    String? name,
    String? role,
    int? reviews,
    int? price,
    double? rating,
    String? image,
    String? category,
    bool? featured
  }) {
    return MentorModel(
        id: id ?? this.id,
        name: name ?? this.name,
        role: role ?? this.role,
        reviews: reviews ?? this.reviews,
        price: price ?? this.price,
        rating: rating ?? this.rating,
        image: image ?? this.image,
        category: category ?? this.category,
        featured: featured ?? this.featured
    );
  }
}