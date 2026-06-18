class ProfileModel {
  final String id;
  final String name;
  final String email;
  final String? avatar;
  final String? bio;

  ProfileModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    this.bio
});

  factory ProfileModel.fromJson(Map<String, dynamic> json){
    return ProfileModel(
      id: json['id'].toString(),
      name: json['name'].toString() ?? '',
      email: json['email'].toString() ?? '',
      avatar: json['avatar'].toString(),
      bio: json['bio'].toString()
    );
  }
}