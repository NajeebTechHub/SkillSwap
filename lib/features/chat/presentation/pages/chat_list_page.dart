import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/constants/app_string.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/router/route_names.dart';
import 'package:skill_swap/core/widgets/app_text_field.dart';
import 'package:skill_swap/features/chat/data/chat_data.dart';
import 'package:skill_swap/features/chat/model/chat_model.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final TextEditingController searchController = TextEditingController();

  final List<ChatModel> chats = ChatData.chat;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.xl),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenPadding,
            ),
            child: Text(AppString.messages, style: context.appTextTheme.headlineSmall),
          ),
          const SizedBox(height: AppSpacing.md),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenPadding,
            ),
            child: AppTextField(
              controller: searchController,
              hint: AppString.search,
              prefixIcon: const Icon(CupertinoIcons.search),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final chat = chats[index];

                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        context.push('${RouteNames.chatPage}/${chat.id}',extra: chat);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.screenPadding,
                          vertical: AppSpacing.md,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(AppSpacing.md),
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
                            const SizedBox(width: AppSpacing.md),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(chat.name, style: context.appTextTheme.titleMedium),
                                  Text(chat.role, style: context.appTextTheme.labelMedium),
                                  const SizedBox(height: AppSpacing.xs),
                                  Text(chat.lastMessage),
                                ],
                              ),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(chat.time),
                                const SizedBox(height: AppSpacing.xs),
                                chat.unread > 0 ? Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSpacing.sm,
                                    vertical: AppSpacing.xs,
                                  ),
                                  decoration: BoxDecoration(
                                    color: context.colors.primary,
                                    borderRadius: BorderRadius.circular(AppSpacing.sm),
                                  ),
                                  child: Text(
                                    chat.unread.toString(),
                                    style: context.appTextTheme.labelSmall?.copyWith(
                                      color: context.colors.surface,
                                    ),
                                  ),
                                ) : const SizedBox.shrink(),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 1,
                      color: context.colors.outline.withValues(alpha: 0.5),)

                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
