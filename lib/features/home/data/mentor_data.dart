import 'package:skill_swap/features/home/models/mentor_model.dart';

class MentorData {
  static final mentors = [
    MentorModel(
      id: '1',
      name: 'Sarah Johnson',
      role: 'Senior Product Designer',
      rating: 4.9,
      reviews: 127,
      price: 75,
      image:
          'https://images.unsplash.com/photo-1758875569897-5e214ccc4e17?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxwcm9mZXNzaW9uYWwlMjBtZW50b3IlMjBwb3J0cmFpdHxlbnwxfHx8fDE3NzU1ODQ3OTl8MA&ixlib=rb-4.1.0&q=80&w=1080',
      category: 'Design',
      featured: true,
      location: 'Rawalpindi',
      experience: 5,
      about: 'Experienced product designer with a focus on user-centered design.',
      expertise: ['UI/UX', 'Wireframing', 'Prototyping'],
      students: 120,
      hours: 40,
      education: 'Bachelor of Design',
      languages: ['English', 'Urdu'],
      availableTimes: ['09:00 AM', '10:00 AM', '11:00 AM', '12:00 PM', '01:00 PM','02:00 PM','03:00 PM','04:00 PM','05:00 PM','06:00 PM',]
    ),
    MentorModel(
      id: '2',
      name: 'Michael Chen',
      role: 'Tech Lead at Google',
      rating: 5.0,
      reviews: 89,
      price: 120,
      image: 'https://images.unsplash.com/photo-1609436132311-e4b0c9370469?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxidXNpbmVzcyUyMGNvYWNoJTIwaGVhZHNob3R8ZW58MXx8fHwxNzc1NTg0Nzk5fDA&ixlib=rb-4.1.0&q=80&w=1080',
      category: 'Technology',
      featured: true,
      location: 'Islamabad',
      experience: 10,
      about: 'Experienced tech lead with a deep understanding of product development.',
      expertise: ['Software Engineering', 'Product Management', 'Agile Methodology'],
      students: 200,
      hours: 60,
      education: 'Master of Science in Computer Science',
      languages: ['English', 'Urdu'],
        availableTimes: ['09:00 AM', '10:00 AM', '11:00 AM', '12:00 PM', '01:00 PM','02:00 PM','03:00 PM','04:00 PM','05:00 PM','06:00 PM',]
    ),
    MentorModel(
      id: '3',
      name: 'Emily Rodriguez',
      role: 'Career Coach',
      rating: 4.8,
      reviews: 156,
      price: 60,
      image: 'https://images.unsplash.com/photo-1573497620053-ea5300f94f21?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjYXJlZXIlMjBtZW50b3IlMjB3b21hbnxlbnwxfHx8fDE3NzU1ODQ3OTl8MA&ixlib=rb-4.1.0&q=80&w=1080',
      category: 'Career',
      featured: true,
      location: 'Lahore',
      experience: 3,
      about: 'Experienced career coach with a focus on helping individuals achieve their career goals.',
      expertise: ['Communication', 'Leadership', 'Time Management'],
      students: 50,
      hours: 30,
      education: 'Bachelor of Arts in Psychology',
      languages: ['English', 'Urdu'],
        availableTimes: ['09:00 AM', '10:00 AM', '11:00 AM', '12:00 PM', '01:00 PM','02:00 PM','03:00 PM','04:00 PM','05:00 PM','06:00 PM',]

    ),
  ];
}
