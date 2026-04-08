import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/crop_selection_screen.dart';
import 'screens/inform_screen.dart';
import 'screens/video_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/reward_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriPlayy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/welcome',
      routes: {
        '/welcome': (ctx) => const WelcomeScreen(),
        '/login': (ctx) => const LoginScreen(),
        '/crop_selection': (ctx) => const CropSelectionScreen(),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == '/inform') {
          final args = settings.arguments;
          if (args is Map<String, dynamic> &&
              args.containsKey('cropName') &&
              args.containsKey('cropImage')) {
            return MaterialPageRoute(
              builder: (_) => InformationScreen(
                cropName: args['cropName'] as String,
                cropImage: args['cropImage'] as String,
              ),
            );
          }
          return MaterialPageRoute(
            builder: (_) => Scaffold(
              appBar: AppBar(title: const Text('Missing data')),
              body: const Center(
                child: Text('Missing arguments for information screen'),
              ),
            ),
          );
        }

        if (settings.name == '/video') {
          final args = settings.arguments;
          if (args is Map<String, dynamic> &&
              args.containsKey('cropName') &&
              args.containsKey('cropImage')) {
            return MaterialPageRoute(
              builder: (_) => VideoScreen(
                cropName: args['cropName'] as String,
                cropImage: args['cropImage'] as String,
              ),
            );
          }
        }

        if (settings.name == '/quiz') {
          final args = settings.arguments;
          if (args is Map<String, dynamic> &&
              args.containsKey('cropName') &&
              args.containsKey('cropImage')) {
            return MaterialPageRoute(
              builder: (_) => QuizScreen(
                cropName: args['cropName'] as String,
                cropImage: args['cropImage'] as String,
              ),
            );
          }
        }

        // ✅ Reward route FIXED
        if (settings.name == '/reward') {
          final args = settings.arguments;
          if (args is Map<String, dynamic> &&
              args.containsKey('score') &&
              args.containsKey('total') &&
              args.containsKey('cropName')) {
            return MaterialPageRoute(
              builder: (_) => RewardScreen(
                score: args['score'] as int,
                total: args['total'] as int,
                cropName: args['cropName'] as String,
              ),
            );
          }
        }

        return null;
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (_) => const WelcomeScreen(),
      ),
    );
  }
}
