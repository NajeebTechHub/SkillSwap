class ReviewsModel {
  final String id;
  final String mentorId;
  final String userName;
  final String userAvatar;
  final String comment;
  final double rating;
  final DateTime createdAt;

  ReviewsModel({
    required this.id,
    required this.mentorId,
    required this.userName,
    required this.userAvatar,
    required this.comment,
    required this.rating,
    required this.createdAt,
  });

  ReviewsModel copyWith({
    String? id,
    String? mentorId,
    String? userName,
    String? userAvatar,
    String? comment,
    double? rating,
    DateTime? createdAt
  }) {
    return ReviewsModel(
      id: id ?? this.id,
      mentorId: mentorId ?? this.mentorId,
      userName: userName ?? this.userName,
      userAvatar: userAvatar ?? this.userAvatar,
      comment: comment ?? this.comment,
      rating: rating ?? this.rating,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

