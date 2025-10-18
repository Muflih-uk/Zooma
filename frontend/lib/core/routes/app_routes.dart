import 'package:flutter/material.dart';
import 'package:frontend/features/home/views/home_page.dart';
import 'package:frontend/features/introduction/views/introduction_page.dart';
import 'package:frontend/features/register/view/register.dart';
import 'package:frontend/features/room/views/create_room_page.dart';
import 'package:frontend/features/wrapper/views/auth_wrapper.dart';
import '../../features/room/views/join_room_page.dart';
import '../../features/leaderboard/views/leaderboard_page.dart';
import '../../features/tasks/views/tasks_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String joinRoom = '/join-room';
  static const String createRoom = '/create-room';
  static const String leaderboard = '/leaderboard';
  static const String tasks = '/tasks';
  static const String submit = '/submit';
  static const String register = '/register';
  static const String introduction = '/introduction';
  static const String initial = '/initial';
  static const String controller = '/controller';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => AuthWrapper());
      case joinRoom:
        return MaterialPageRoute(builder: (_) => JoinRoomScreen());
      case createRoom:
        return MaterialPageRoute(builder: (_) => CreateRoomScreen());
      case leaderboard:
        return MaterialPageRoute(builder: (_) => LeaderboardPage());
      case tasks:
        return MaterialPageRoute(
          builder: (_) => TasksScreen(),
        );
      case introduction:
        return MaterialPageRoute(
          builder: (_) => BackgroundAnimationScreen()
        );
      case register:
        return MaterialPageRoute(
          builder: (_) => RegisterScreen()
        );
      case initial:
        return MaterialPageRoute(
          builder: (_) => HomeScreen()
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}