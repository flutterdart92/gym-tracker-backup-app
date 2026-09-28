import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorebird_code_push/shorebird_code_push.dart';
import 'package:restart_app/restart_app.dart';

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
        home: const ShorebirdUpdateWrapper(
          child: MainNavigationScreen(),
        ),
      ),
    );
  }
}

class ShorebirdUpdateWrapper extends StatefulWidget {
  final Widget child;
  const ShorebirdUpdateWrapper({super.key, required this.child});

  @override
  State<ShorebirdUpdateWrapper> createState() => _ShorebirdUpdateWrapperState();
}

class _ShorebirdUpdateWrapperState extends State<ShorebirdUpdateWrapper> {
  final _shorebirdUpdater = ShorebirdUpdater();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkForUpdates();
    });
  }

  Future<void> _checkForUpdates() async {
    try {
      if (!_shorebirdUpdater.isAvailable) return;

      final updateStatus = await _shorebirdUpdater.checkForUpdate();

      if (updateStatus == UpdateStatus.outdated) {
        await _shorebirdUpdater.update();

        if (mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: const Text('New Update Available 🚀'),
              content: const Text(
                  'A new update has been downloaded. Tap restart to apply.'),
              actions: [
                ElevatedButton(
                  onPressed: () async {
                    await Restart.restartApp();
                    await Future.delayed(const Duration(milliseconds: 500));
                    exit(0);
                  },
                  child: const Text('Restart App'),
                ),
              ],
            ),
          );
        }
      }
    } catch (e) {
      debugPrint("Shorebird silent update error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
