import 'package:skill_swap/features/chat/model/chat_model.dart';

class ChatData {
  static final chat = [
    ChatModel(
      id: '1',
      name: 'Sarah Johnson',
      role: 'Senior Product Designer',
      lastMessage: 'Looking forward to our session!',
      time: '2m ago',
      unread: 2,
      online: true,
    ),
    ChatModel(
      id: '2',
      name: 'Michael Chen',
      role: 'Tech Lead at Google',
      lastMessage: 'I\'ll send you the resources',
      time: '1h ago',
      unread: 0,
      online: true,
    ),
    ChatModel(
      id: '3',
      name: 'Emily Rodriguez',
      role: 'Career Coach',
      lastMessage: 'Great progress on your resume!',
      time: '3h ago',
      unread: 1,
      online: false,
    ),
    ChatModel(
      id: '4',
      name: 'Alex Thompson',
      role: 'Full Stack Developer',
      lastMessage: 'Check out this coding challenge',
      time: '1d ago',
      unread: 0,
      online: false,
    ),
  ];
}
