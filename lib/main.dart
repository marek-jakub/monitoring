import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// For testing purposes
import 'package:drift/native.dart';

import '../data/monitoring_db.dart';
import '../models/models.dart';

import '../navigation/monitoring_route_parser.dart';
import '../navigation/monitoring_router.dart';
import 'monitoring_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MonitoRing());
}

class MonitoRing extends StatefulWidget {
  const MonitoRing({super.key});

  @override
  State<MonitoRing> createState() => _MonitoRingState();
}

class _MonitoRingState extends State<MonitoRing> {
  // For testing purposes
  final _monRingDb = MonRingDb(NativeDatabase.memory());

  // For app release
  //final _monRingDb = MonRingDb();
  final _appStateManager = MonitoRingStateManager();
  final _profileManager = ProfileManager();
  final _ringDataManager = RingDataManager();
  late MonitoRingRouter _monitoringRouter;
  final routerParser = MonitoRingRouteParser();

  @override
  void initState() {
    super.initState();
    _monitoringRouter = MonitoRingRouter(
        monStateManager: _appStateManager,
        profileManager: _profileManager,
        ringDataManager: _ringDataManager);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MonRingDb>(
          create: (context) => _monRingDb,
          dispose: (context, db) => db.close(),
        ),
        ChangeNotifierProxyProvider<MonRingDb, RingDataManager>(
          create: (context) => _ringDataManager,
          update: (context, db, notifier) => notifier!
            ..initDb(db)
            ..getSessionLocationViewStream(),
        ),
        ChangeNotifierProvider(create: (context) => _appStateManager),
        ChangeNotifierProvider(create: (context) => _profileManager),
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = MonitoRingTheme.dark();
          } else {
            theme = MonitoRingTheme.light();
          }

          return MaterialApp.router(
            theme: theme,
            title: 'MonitoRing',
            backButtonDispatcher: RootBackButtonDispatcher(),
            debugShowCheckedModeBanner: false,
            routeInformationParser: routerParser,
            routerDelegate: _monitoringRouter,
          );
        },
      ),
    );
  }
}
