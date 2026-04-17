import 'dart:ui';

class OnboardingModel {

  OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
    required this.gradient,
  });
  final String title;
  final String description;
  final String image;
  final List<Color> gradient;

}