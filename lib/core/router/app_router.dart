import 'package:go_router/go_router.dart';
import 'package:skill_swap/core/router/route_names.dart';
import 'package:skill_swap/features/alert/presentation/pages/alert_page.dart';
import 'package:skill_swap/features/bottom_navigation/pages/bottom_navbar.dart';
import 'package:skill_swap/features/chat/data/chat_data.dart';
import 'package:skill_swap/features/chat/data/messages_data.dart';
import 'package:skill_swap/features/chat/presentation/pages/chat_list_page.dart';
import 'package:skill_swap/features/chat/presentation/pages/chat_page.dart';
import 'package:skill_swap/features/home/data/mentor_data.dart';
import 'package:skill_swap/features/home/presentation/pages/home_page.dart';
import 'package:skill_swap/features/home/presentation/pages/mentor_details_page.dart';
import 'package:skill_swap/features/profile/presentation/pages/profile_page.dart';
import 'package:skill_swap/features/auth/presentation/pages/login/login_page.dart';
import 'package:skill_swap/features/auth/presentation/pages/signup/signup_page.dart';
import 'package:skill_swap/features/auth/presentation/pages/verification/verification_page.dart';
import 'package:skill_swap/features/onboarding/presentation/pages/onboarding_pages.dart';
import 'package:skill_swap/features/splash/presentation/splash_page.dart';

final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
          path: RouteNames.onboarding,
          builder: (context, state) => const OnboardingPages(),
      ),
      GoRoute(
          path: RouteNames.login,
          builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
          path: RouteNames.signup,
          builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
          path: RouteNames.verification,
          builder: (context, state) => const VerificationPage(),
      ),
      GoRoute(
        path: '${RouteNames.mentorDetails}/:id',
        builder: (context, state){
            final id = state.pathParameters['id'];

            final mentor = MentorData.mentors.firstWhere((m) => m.id == id);

            return MentorDetailsPage(featuredMentors: mentor);
          },
      ),

      GoRoute(
          path: '${RouteNames.chatPage}/:id',
          builder: (context, state){
            final chatId = state.pathParameters['id'];

            final messages = MessagesData.messages
                .where((m) => m.chatId == chatId)
                .toList();

            final chat = ChatData.chat.firstWhere((c) => c.id == chatId);


            return ChatPage(messages: messages, chat: chat);
          }
      ),
      ShellRoute(
          builder: (context, state, child){
            return BottomNavBar(child: child);
          },
          routes: [
            GoRoute(
                path: RouteNames.home,
                builder: (context, state) => const HomePage()
            ),
            GoRoute(
                path: RouteNames.chatList,
                builder: (context, state) => const ChatListPage()
            ),
            GoRoute(
                path: RouteNames.alert,
                builder: (context, state) => const AlertPage()
            ),
            GoRoute(
                path: RouteNames.profile,
                builder: (context, state) => const ProfilePage()
            ),
          ])
    ],
);