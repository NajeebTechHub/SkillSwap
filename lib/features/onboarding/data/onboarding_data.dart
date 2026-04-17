
import 'package:flutter/material.dart';

import 'package:skill_swap/features/onboarding/models/onboarding_model.dart';

class OnboardingData {
  static final slides = [
    OnboardingModel(
      title: "Find Expert Mentors",
      description:
      "Connect with experienced professionals ready to share their knowledge and help you grow.",
      image:
      "https://images.unsplash.com/photo-1758524944402-1903b38f848f",
      gradient: [Colors.blue, Colors.purple],
    ),
    OnboardingModel(
      title: "Book Sessions Easily",
      description:
      "Schedule one-on-one sessions with flexible booking options.",
      image:
      "https://images.unsplash.com/photo-1758874572744-26aa02a8f5c0",
      gradient: [Colors.purple, Colors.teal],
    ),
    OnboardingModel(
      title: "Grow Your Skills",
      description:
      "Learn new skills and achieve your goals with guidance.",
      image:
      "https://images.unsplash.com/photo-1773270196888-0cdacb07edae",
      gradient: [Colors.teal, Colors.pink],
    ),
  ];
}