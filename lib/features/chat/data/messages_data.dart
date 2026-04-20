import 'package:skill_swap/features/chat/model/message_model.dart';

class MessagesData {
  static final messages = [
    MessageModel(
      id: '1',
      chatId: '1',
      text: 'Hi! Thanks for booking a session with me.',
      sender: 'mentor',
      time: '10:30 AM',
    ),
    MessageModel(
      id: '2',
      chatId: '1',
      text: 'I\'m looking forward to discussing your design portfolio!',
      sender: 'mentor',
      time: '10:30 AM',
    ),
    MessageModel(
      id: '3',
      chatId: '1',
      text: 'Hi Sarah! I\'m excited too. I have a few projects I\'d love to get your feedback on.',
      sender: 'user',
      time: '10:32 AM',
    ),
    MessageModel(
      id: '4',
      chatId: '1',
      text: 'Perfect! Feel free to share them before our session so I can review them.',
      sender: 'mentor',
      time: '10:33 AM',
    ),
    MessageModel(
      id: '5',
      chatId: '1',
      text: 'Will do! I\'ll send over a Figma link.',
      sender: 'user',
      time: '10:35 AM',
    ),
  ];
}
