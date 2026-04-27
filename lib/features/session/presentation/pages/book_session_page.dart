import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/constants/app_string.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/theme/app_colors.dart';
import 'package:skill_swap/core/widgets/app_button.dart';
import 'package:skill_swap/features/home/models/mentor_model.dart';
import 'package:table_calendar/table_calendar.dart';

class BookSessionPage extends StatefulWidget {
  final MentorModel mentor;
  const BookSessionPage({super.key, required this.mentor});

  @override
  State<BookSessionPage> createState() => _BookSessionPageState();
}

class _BookSessionPageState extends State<BookSessionPage> {
  DateTime selectedDate = DateTime.now();
  DateTime focusDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppString.bookASession, style: context.appTextTheme.headlineSmall,),
            const SizedBox(height: AppSpacing.xs,),
            Text(AppString.selectYourDataTime,style: context.appTextTheme.labelMedium,)
          ],
        ),
        bottom: PreferredSize(preferredSize: const Size.fromHeight(20), child: Divider(color: context.colors.outline.withValues(alpha: 0.5),)),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: context.colors.outline.withValues(alpha: 0.5)))
          ),
          child: AppButton(text: AppString.continueToPayment, onPressed: (){}),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppString.selectDate, style: context.appTextTheme.titleLarge,),
            const SizedBox(height: AppSpacing.md,),
            Container(
              padding: const EdgeInsets.all(AppSpacing.xl),
              decoration: BoxDecoration(
                border: Border.all(color: context.colors.outline.withValues(alpha: 0.5)),
                borderRadius: AppRadius.mdRadius
              ),
              child: TableCalendar(
                  focusedDay: focusDate,

                selectedDayPredicate: (day) {
                  return isSameDay(selectedDate, day);
                },
                onDaySelected: (selectedDay, _) {
                  setState(() {
                    selectedDate = selectedDay;
                    focusDate = selectedDay;
                  });
                },
                  firstDay: DateTime.utc(2000, 1, 1),
                  lastDay: DateTime.utc(2100, 1, 1),
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true
                  ),

                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: context.colors.primary,
                      // borderRadius: AppRadius.smRadius,
                      shape: BoxShape.circle
                    ),
                    todayDecoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    todayTextStyle: TextStyle(
                      color: context.colors.onSurface,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
              ),
            ),
            const SizedBox(height: AppSpacing.xl,),
            Text(AppString.availableTime,style: context.appTextTheme.titleLarge,),
            const SizedBox(height: AppSpacing.md,),
            GridView.builder(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2.5
                ),
                itemCount: widget.mentor.availableTimes.length,
                itemBuilder: (context, index){
                  final mentor = widget.mentor.availableTimes[index];

                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md,vertical: AppSpacing.sm),
                    decoration: BoxDecoration(
                        border: Border.all(color: context.colors.outline.withValues(alpha: 0.5)),
                        borderRadius: AppRadius.mdRadius
                    ),
                    child: Center(child: Text(mentor,)),
                  );
                }),

            Container(
              padding: const EdgeInsets.all(AppSpacing.xl),
              decoration: BoxDecoration(
                color: context.colors.primary.withValues(alpha: 0.1),
                borderRadius: AppRadius.mdRadius
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppString.sessionSummary,style: context.appTextTheme.titleLarge,),
                  const SizedBox(height: AppSpacing.md,),
                  const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(AppString.duration),Text('1 hour')],),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text(AppString.date),Text('${selectedDate.day} ${selectedDate.month} ${selectedDate.year}')],),
                  const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(AppString.time),Text('12:00 PM')],),
                  const Divider(),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text(AppString.totalPrice),Text('\$${widget.mentor.price}')]),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
