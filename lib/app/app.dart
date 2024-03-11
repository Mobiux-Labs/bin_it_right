import 'dart:async';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reseacue/app/app_lifecycle/app_lifecycle.dart';
import 'package:reseacue/app/audio/audio_controller.dart';
import 'package:reseacue/app/settings/persistence/settings_persistence.dart';
import 'package:reseacue/app/settings/settings.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/overlays/overlays.dart';
import 'package:reseacue/app/ui/splash_screen.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/utils/images.dart';
import 'package:transparent_image/transparent_image.dart';

class App extends StatefulWidget {
  final SettingsPersistence settingsPersistence;

  const App({
    required this.settingsPersistence,
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Timer timer;

  final values = [];
  final ValueNotifier<int> _index = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    for (int treeAnimationFrameIndex = 1;
        treeAnimationFrameIndex <= 45;
        treeAnimationFrameIndex++) {
      values.add(treeAnimationFrameIndex.toString());
    }
    timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      _index.value += 1;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: Path.root,
          builder: (context, state) => const SplashScreen(
            key: Key(Constants.splashScreenKey),
          ),
          routes: const [],
        ),
        GoRoute(
          path: Path.startGameOverlay,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: GameWidget<Reseacue>.controlled(
              gameFactory: Reseacue.new,
              overlayBuilderMap: {
                TutorialOverlay.id: (_, game) => TutorialOverlay(game: game),
                StartGameOverlay.id: (_, game) => StartGameOverlay(game: game),
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
                ResetSettingsOverlay.id: (_, game) =>
                    ResetSettingsOverlay(game: game),
                GameOverOverlay.id: (_, game) => GameOverOverlay(game: game),
                ExitConfirmationOverlay.id: (_, game) =>
                    ExitConfirmationOverlay(game: game),
              },
              initialActiveOverlays: [
                StartGameOverlay.id,
                TutorialOverlay.id,
              ],
              loadingBuilder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF51B937),
                        Color(0xFFCBDE81),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        image: AssetImage(getPathFromAssetString(
                            AssetConstants.splashLoading)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: ValueListenableBuilder(
                                valueListenable: _index,
                                builder: (context, data, child) {
                                  return FadeInImage(
                                    placeholder: MemoryImage(kTransparentImage),
                                    image: AssetImage(
                                      getPathFromAssetString(
                                          'Tree animation_${values[data % values.length]}.png'),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const Text(
                              'Loading...',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontFamily: 'Digitalt',
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          ),
          routes: const [],
        ),
      ],
    );

    return AppLifecycleObserver(
      child: MultiProvider(
        providers: [
          Provider<SettingsController>(
            lazy: false,
            create: (context) => SettingsController(
              persistence: widget.settingsPersistence,
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
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
          );
        }),
      ),
    );
  }
}
