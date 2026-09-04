import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:gym_tracker_app_backup/features/dashboard/presentation/pages/main_navigation_screen.dart';
>>>>>>> c8a587a ( update project from gym_tracker_app to gym_tracker_app_backup)
import 'package:provider/provider.dart';
import 'core/services/hive_service.dart';
import 'features/dashboard/presentation/pages/main_navigation_screen.dart';
import 'features/diet/presentation/providers/diet_provider.dart';
import 'features/workout/presentation/providers/workout_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(const GymTrackerAppBackup());
}

class GymTrackerAppBackup extends StatelessWidget {
  const GymTrackerAppBackup({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WorkoutProvider()),
        ChangeNotifierProvider(create: (_) => DietProvider()),
      ],
      child: MaterialApp(
        title: 'Gym Tracker Backup',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainNavigationScreen(),
      ),
    );
  }
}
