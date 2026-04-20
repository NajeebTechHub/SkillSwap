class ChatModel {
  final String id;
  final String name;
  final String role;
  final String lastMessage;
  final String time;
  final int unread;
  final bool online;

  ChatModel({
    required this.id,
    required this.name,
    required this.role,
    required this.lastMessage,
    required this.time,
    required this.unread,
    required this.online,
  });

  ChatModel copyWith({
    String? id,
    String? name,
    String? role,
    String? lastMessage,
    String? time,
    int? unread,
    bool? online,
  }) {
    return ChatModel(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      lastMessage: lastMessage ?? this.lastMessage,
      time: time ?? this.time,
      unread: unread ?? this.unread,
      online: online ?? this.online,
    );
  }
}