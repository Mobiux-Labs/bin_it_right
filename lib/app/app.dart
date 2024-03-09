import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reseacue/app/app_lifecycle/app_lifecycle.dart';
import 'package:reseacue/app/audio/audio_controller.dart';
import 'package:reseacue/app/settings/persistence/settings_persistence.dart';
import 'package:reseacue/app/settings/settings.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/overlays/countdown.dart';
import 'package:reseacue/overlays/game_over.dart';
import 'package:reseacue/overlays/main_menu.dart';
import 'package:reseacue/app/ui/splash_screen.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/overlays/reset.dart';
import 'package:reseacue/overlays/settings.dart';

import '../overlays/pause_button.dart';
import '../overlays/pause_menu.dart';

class App extends StatelessWidget {
  final SettingsPersistence settingsPersistence;

  const App({
    required this.settingsPersistence,
    super.key,
  });

  static final _router = GoRouter(
    routes: [
      GoRoute(
        path: Path.root,
        builder: (context, state) => const SplashScreen(
          key: Key(Constants.splashScreenKey),
        ),
        routes: const [],
      ),
      GoRoute(
        path: Path.mainMenu,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: GameWidget<Reseacue>.controlled(
            gameFactory: Reseacue.new,
            //TODO: Stop gameplay and resume on press of start button
            overlayBuilderMap: {
              MainMenu.id: (_, game) => MainMenu(game: game),
              CountDownOverlay.id: (_, game) => CountDownOverlay(game: game),
              PauseButton.id: (BuildContext context, Reseacue game) =>
                  PauseButton(
                    game: game,
                  ),
              PauseMenu.id: (BuildContext context, Reseacue game) => PauseMenu(
                    game: game,
                  ),
              SettingsMenu.id: (_, game) => SettingsMenu(game: game),
              ResetOverlay.id: (_, game) => ResetOverlay(game: game),
              GameOver.id: (_, game) => GameOver(game: game),
            },
            initialActiveOverlays: const ['MainMenu'],
            // initialActiveOverlays: const [PauseButton.ID],
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
        routes: const [],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/countdown_1.png"), context);
    precacheImage(AssetImage("assets/images/countdown_2.png"), context);
    precacheImage(AssetImage("assets/images/countdown_3.png"), context);
    return AppLifecycleObserver(
      child: MultiProvider(
        providers: [
          Provider<SettingsController>(
            lazy: false,
            create: (context) => SettingsController(
              persistence: settingsPersistence,
            )..loadStateFromPersistence(),
          ),
          ProxyProvider2<SettingsController, ValueNotifier<AppLifecycleState>,
              AudioController>(
            // Ensures that the AudioController is created on startup,
            // and not "only when it's needed", as is default behavior.
            // This way, music starts immediately.
            lazy: false,
            create: (context) => AudioController()..initialize(),
            update: (context, settings, lifecycleNotifier, audio) {
              if (audio == null) throw ArgumentError.notNull();
              audio.attachSettings(settings);
              audio.attachLifecycleNotifier(lifecycleNotifier);
              return audio;
            },
            dispose: (context, audio) => audio.dispose(),
          ),
        ],
        child: Builder(builder: (context) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routeInformationProvider: _router.routeInformationProvider,
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
          );
        }),
      ),
    );
  }
}
