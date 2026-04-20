class MessageModel {
  final String id;
  final String chatId;
  final String text;
  final String sender;
  final String time;

  MessageModel({
    required this.id,
    required this.chatId,
    required this.text,
    required this.sender,
    required this.time,
  });

  MessageModel copyWith({
    String? id,
    String? chatId,
    String? text,
    String? sender,
    String? time,
  }) {
    return MessageModel(
        id: id ?? this.id,
        chatId: chatId ?? this.chatId,
        text: text ?? this.text,
        sender: sender ?? this.sender,
        time: time ?? this.time,
    );
  }
}
