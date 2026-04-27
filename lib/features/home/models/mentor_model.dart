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
  final String location;
  final int experience;
  final String about;
  final List<String> expertise;
  final int students;
  final int hours;
  final String education;
  final List<String> languages;
  final List<String> availableTimes;

  MentorModel({
    required this.id,
    required this.name,
    required this.role,
    required this.reviews,
    required this.price,
    required this.rating,
    required this.image,
    required this.category,
    required this.featured,
    required this.location,
    required this.experience,
    required this.about,
    required this.expertise,
    required this.students,
    required this.hours,
    required this.education,
    required this.languages,
    required this.availableTimes
  });

  MentorModel copyWith({
    String? id,
    String? name,
    String? role,
    int? reviews,
    int? price,
    double? rating,
    String? image,
    String? category,
    bool? featured,
    String? location,
    int? experience,
    String? about,
    List<String>? expertise,
    int? students,
    int? hours,
    String? education,
    List<String>? languages,
    List<String>? availableTimes,
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
      featured: featured ?? this.featured,
      location: location ?? this.location,
      experience: experience ?? this.experience,
      about: about ?? this.about,
      expertise: expertise ?? this.expertise,
      students: students ?? this.students,
      hours: hours ?? this.hours,
      education: education ?? this.education,
      languages: languages ?? this.languages,
      availableTimes: availableTimes ?? this.availableTimes
    );
  }
}
