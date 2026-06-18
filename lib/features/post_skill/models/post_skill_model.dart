class PostSkillModel {
  final String? id;
  final String userId;
  final String skillName;
  final String category;
  final String location;
  final String type;
  final String level;
  final String description;
  final DateTime? createdAt;
  final int? price;

  PostSkillModel({
    this.id,
    required this.userId,
    required this.skillName,
    required this.category,
    required this.location,
    required this.type,
    required this.level,
    required this.description,
    this.createdAt,
    this.price
});

  factory PostSkillModel.fromJson(Map<String, dynamic> json){
    return PostSkillModel(
        id: json['id'].toString(),
        userId: json['user_id'].toString(),
        skillName: json['skill_name'].toString(),
        category: json['category'].toString(),
        location: json['location'].toString(),
        type: json['type'].toString(),
        level: json['level'].toString(),
        description: json['description'].toString(),
        createdAt: DateTime.parse(json['created_at'].toString()),
        price: int.parse(json['price'].toString())
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'user_id' : userId,
      'skill_name' : skillName,
      'category' : category,
      'location' : location,
      'type' : type,
      'level' : level,
      'description' : description,
      'created_at' : createdAt,
      'price' : price
    };
  }
}