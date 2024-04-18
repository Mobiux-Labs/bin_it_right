import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reseacue/app/app_lifecycle/app_lifecycle.dart';
import 'package:reseacue/app/audio/audio_controller.dart';
import 'package:reseacue/app/settings/persistence/settings_persistence.dart';
import 'package:reseacue/app/settings/settings.dart';
import 'package:reseacue/app/storage/persistence/storage_persistence.dart';
import 'package:reseacue/app/storage/storage.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/overlays/gift_opening_overlay.dart';
import 'package:reseacue/overlays/overlays.dart';
import 'package:reseacue/app/ui/splash_screen.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/overlays/upgrade_overlay.dart';
import 'package:reseacue/utils/images.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatefulWidget {
  final SettingsPersistence settingsPersistence;
  final StoragePersistence storagePersistence;

  const App({
    required this.settingsPersistence,
    required this.storagePersistence,
    super.key,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: Path.root,
          builder: (context, state) => SplashScreen(
            key: const Key(Constants.splashScreenKey),
          ),
          routes: const [],
        ),
        GoRoute(
          path: Path.startGameOverlay,
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: GameWidget<Reseacue>.controlled(
              gameFactory: () => Reseacue(
                settingsController: Provider.of<SettingsController>(context),
                storageController: Provider.of<StorageController>(context),
                audioController: Provider.of<AudioController>(context),
              ),
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
                UpgradeOverlay.id: (_, game) => UpgradeOverlay(
                      game: game,
                      storageController:
                          Provider.of<StorageController>(context),
                    ),
                GiftOpeningOverlay.id: (_, game) =>
                    GiftOpeningOverlay(mainGame: game),
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
                  child: Stack(
                    children: [
                      FadeInImage(
                        placeholder: MemoryImage(kTransparentImage),
                        image: AssetImage(
                          getPathFromAssetString(AssetConstants.splashLoading),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: FadeInImage(
                                    placeholder: MemoryImage(
                                      kTransparentImage,
                                    ),
                                    image: AssetImage(
                                      getPathFromAssetString(
                                        AssetConstants
                                            .treeAnimationFortyFifthFrame,
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Setting up the game, please wait...',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'Digitalt',
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.none,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
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
          Provider<StorageController>(
            lazy: false,
            create: (context) => StorageController(
              persistence: widget.storagePersistence,
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
          SettingsController settingsController =
              context.watch<SettingsController>();

          return ValueListenableBuilder(
              valueListenable: settingsController.locale,
              builder: (context, locale, child) {
                return MaterialApp.router(
                  locale: Locale(locale),
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  debugShowCheckedModeBanner: false,
                  routeInformationProvider: router.routeInformationProvider,
                  routeInformationParser: router.routeInformationParser,
                  routerDelegate: router.routerDelegate,
                );
              });
        }),
      ),
    );
  }
}
