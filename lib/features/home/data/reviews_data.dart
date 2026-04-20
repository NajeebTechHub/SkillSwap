import 'package:skill_swap/features/home/models/reviews_model.dart';

class ReviewsData {
  static final review = [
    ReviewsModel(
      id: '1',
      mentorId: '1',
      userName: 'Sarah Johnson',
      userAvatar: 'SJ',
      comment: 'Great mentor! Would definitely recommend.',
      rating: 3.6,
      createdAt: DateTime.now(),
    ),
    ReviewsModel(
      id: '2',
      mentorId: '1',
      userName: 'Michael Chen',
      userAvatar: 'MC',
      comment: 'Thoroughly helpful and knowledgeable.',
      rating: 4.2,
      createdAt: DateTime.now(),
    ),
    ReviewsModel(
      id: '3',
      mentorId: '1',
      userName: 'Emily Rodriguez',
      userAvatar: 'ER',
      comment: 'Excellent communication skills!',
      rating: 4.8,
      createdAt: DateTime.now(),
    ),
    ReviewsModel(
      id: '1',
      mentorId: '2',
      userName: 'Sarah Johnson',
      userAvatar: 'SJ',
      comment: 'Great mentor! Would definitely recommend.',
      rating: 3.6,
      createdAt: DateTime.now(),
    ),
    ReviewsModel(
      id: '2',
      mentorId: '2',
      userName: 'Michael Chen',
      userAvatar: 'MC',
      comment: 'Thoroughly helpful and knowledgeable.',
      rating: 4.2,
      createdAt: DateTime.now(),
    ),
    ReviewsModel(
      id: '3',
      mentorId: '2',
      userName: 'Emily Rodriguez',
      userAvatar: 'ER',
      comment: 'Excellent communication skills!',
      rating: 4.8,
      createdAt: DateTime.now(),
    ),

  ];
}
