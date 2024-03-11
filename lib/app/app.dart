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
import 'package:reseacue/overlays/leaving_confirmation_overlay.dart';
import 'package:reseacue/overlays/main_menu.dart';
import 'package:reseacue/app/ui/splash_screen.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/overlays/reset.dart';
import 'package:reseacue/overlays/settings.dart';
import 'package:reseacue/overlays/tutorial_overlay.dart';
import 'package:reseacue/overlays/pause_button.dart';
import 'package:reseacue/overlays/pause_menu.dart';

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
        path: Path.MainMenuOverlay,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: GameWidget<Reseacue>.controlled(
            gameFactory: Reseacue.new,
            overlayBuilderMap: {
              TutorialOverlay.id: (_, game) => TutorialOverlay(game: game),
              MainMenuOverlay.id: (_, game) => MainMenuOverlay(game: game),
              CountDownOverlay.id: (_, game) => CountDownOverlay(game: game),
              GamePlayOverlay.id: (BuildContext context, Reseacue game) =>
                  GamePlayOverlay(
                    game: game,
                  ),
              PauseOverlay.id: (BuildContext context, Reseacue game) =>
                  PauseOverlay(
                    game: game,
                  ),
              SettingsOverlay.id: (_, game) => SettingsOverlay(game: game),
              ResetOverlay.id: (_, game) => ResetOverlay(game: game),
              GameOverOverlay.id: (_, game) => GameOverOverlay(game: game),
              ExitConfirmationOverlay.id: (_, game) =>
                  ExitConfirmationOverlay(game: game),
            },
            initialActiveOverlays: [
              MainMenuOverlay.id,
              TutorialOverlay.id,
            ],
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
