import 'package:flutter/material.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/constants/app_string.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/features/alert/data/notification_data.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = NotificationData.notifications;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.notifications,style: context.appTextTheme.headlineSmall,),
        actions: [
          IconButton(onPressed: (){}, icon: Text(AppString.markAllRead,style: context.appTextTheme.labelSmall?.copyWith(color: context.colors.primary),))
        ],
        bottom: PreferredSize(preferredSize: const Size.fromHeight(AppSpacing.md), child: Divider(color: context.colors.outline,)),
      ),
      body: ListView.separated(
        itemCount: notifications.length,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
          itemBuilder: (context, index){
           final notification = notifications[index];

           return Container(
             padding: const EdgeInsets.all(AppSpacing.md),
             decoration: BoxDecoration(
               border: Border.all(color: context.colors.outline),
               color: notification.unread == true ? context.colors.primary.withValues(alpha: 0.1) : context.colors.surface,
               borderRadius: AppRadius.mdRadius
             ),
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                   padding: const EdgeInsets.all(AppSpacing.md),
                   decoration: BoxDecoration(
                     color: notification.iconColor.withValues(alpha: 0.1),
                     borderRadius: AppRadius.smRadius,
                   ),
                   child: Icon(notification.icon,color: notification.iconColor,)
                 ),
                 const SizedBox(width: AppSpacing.md),

                 Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(notification.title, style: context.appTextTheme.titleSmall),
                       const SizedBox(height: AppSpacing.xs),
                       Text(notification.message, style: context.appTextTheme.labelMedium),
                       const SizedBox(height: AppSpacing.xs),
                       Text(notification.time,  style: context.appTextTheme.labelMedium),
                     ],
                   ),
                 ),

                 Column(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     notification.unread == true ? Container(
                       padding: const EdgeInsets.symmetric(
                         horizontal: AppSpacing.sm,
                         vertical: AppSpacing.xs,
                       ),
                       decoration: BoxDecoration(
                         color: context.colors.primary,
                         borderRadius: BorderRadius.circular(AppSpacing.sm),
                       ),
                       child: Text(
                        AppString.newBadge,
                         style: context.appTextTheme.labelSmall?.copyWith(
                           color: context.colors.surface,
                         ),
                       ),
                     ) : const SizedBox.shrink()
                   ],
                 )
               ],
             ),
           );
          },
          separatorBuilder: (_,_) => const SizedBox(height: AppSpacing.md,),
          )
    );
  }
}
