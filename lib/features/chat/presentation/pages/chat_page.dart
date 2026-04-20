import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/theme/extensions/app_custom_colors.dart';
import 'package:skill_swap/core/widgets/app_text_field.dart';
import 'package:skill_swap/features/chat/model/chat_model.dart';
import 'package:skill_swap/features/chat/model/message_model.dart';

class ChatPage extends StatefulWidget {
  final List<MessageModel> messages;
  final ChatModel chat;

  const ChatPage({super.key, required this.messages, required this.chat});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 40,
        title: Row(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [context.colors.primary, context.colors.secondary],
                    ),
                    borderRadius: AppRadius.circleRadius,
                  ),
                  child: Text(
                    'NJ',
                    style: context.appTextTheme.titleSmall?.copyWith(
                      color: context.colors.surface,
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colors.surface,
                    ),
                    child: Container(
                      width: AppSpacing.sm,
                      height: AppSpacing.sm,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: widget.chat.online ? context.customColors.success : context.colors.outline,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(width: AppSpacing.md),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(widget.chat.name, style: context.appTextTheme.titleMedium),
                  Text( widget.chat.online ? 'Online' : 'Offline', style: context.appTextTheme.labelMedium?.copyWith(color:widget.chat.online ? context.customColors.success : context.colors.outline))
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),

        ],
        bottom: PreferredSize(preferredSize: const Size.fromHeight(AppSpacing.md),
            child: Divider(color: context.colors.outline,)),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        bottom: true,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding,vertical: AppSpacing.screenPadding),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: context.colors.outline, width: 1)),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.attachment_rounded),
              ),
              const SizedBox(width: AppSpacing.xs,),
              Flexible(
                child: SizedBox(
                  height: 45,
                  child: AppTextField(
                    controller: _messageController,
                    fillColor: context.colors.outline.withValues(alpha: 0.3),
                    hint: 'Type a message...',
                    suffixIcon: const Icon(Icons.sticky_note_2),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm,),
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  borderRadius: AppRadius.smRadius
                ),
                child: Icon(Icons.send,color: context.colors.surface,),
              )
            ],
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: widget.messages.length,
          itemBuilder: (context,index){
          final message = widget.messages[index];

           return Padding(
             padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
             child: Align(
               alignment: message.sender == 'user' ? Alignment.centerRight : Alignment.centerLeft,
               child: Container(
                 constraints: BoxConstraints(maxWidth: context.width * 0.7),
                 padding: const EdgeInsets.all(AppSpacing.md),
                 decoration: BoxDecoration(
                   color: message.sender == 'user' ? context.colors.primary : context.colors.outline.withValues(alpha: 0.5),
                   borderRadius: BorderRadius.circular(AppSpacing.md),
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(message.text, style: context.appTextTheme.bodyMedium?.copyWith(color: message.sender == 'user' ? context.colors.surface : context.colors.onSurface)),
                     const SizedBox(height: AppSpacing.xs),
                     Text(message.time, style: context.appTextTheme.labelMedium?.copyWith(color: message.sender == 'user' ? context.colors.surface : context.colors.onSurface)),

                   ],
                 ),
               ),
             ),
           );
          },
          separatorBuilder: (_,_) => const SizedBox(height: AppSpacing.md),
          ),
    );
  }
}
