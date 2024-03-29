import 'package:flutter/material.dart';
import 'package:reseacue/app/storage/storage.dart';
import 'package:reseacue/app/ui/components/custom_animated_button.dart';
import 'package:reseacue/assets.dart';
import 'package:reseacue/constants/constants.dart';
import 'package:reseacue/game/game.dart';
import 'package:reseacue/utils/images.dart';

class Skin extends StatelessWidget {
  const Skin({
    super.key,
    required this.skinNumber,
    required this.onTap,
    required this.selectedSkinIndex,
    required this.color,
  });

  final int skinNumber;
  final Function onTap;
  final int selectedSkinIndex;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: color,
          border: Border.all(
            strokeAlign: BorderSide.strokeAlignOutside,
            color: selectedSkinIndex == skinNumber
                ? Colors.white
                : Colors.black.withOpacity(0.2),
            width: selectedSkinIndex == skinNumber ? 6 : 2,
          ),
        ),
      ),
    );
  }
}

class UpgradeOverlay extends StatefulWidget {
  static String id = 'upgrade_overlay';

  final Reseacue game;
  final StorageController storageController;

  const UpgradeOverlay({
    super.key,
    required this.game,
    required this.storageController,
  });

  @override
  State<UpgradeOverlay> createState() => _UpgradeOverlayState();
}

class _UpgradeOverlayState extends State<UpgradeOverlay> {
  int selectedSkinIndex = 1;
  int selectedTab = 1;
  int appliedSkin = 1;
  double magnetPowerDuration = 5.0;

  @override
  void initState() {
    setState(() {
      selectedSkinIndex = widget.storageController.vehicleSkin.value;
      appliedSkin = selectedSkinIndex;
      magnetPowerDuration = widget.storageController.magnetPowerDuration.value;
    });
    super.initState();
  }

  int getTokensByDuration(double duration) {
    switch (duration) {
      case 30.0:
        return 25000;
      case 25.0:
        return 20000;
      case 20.0:
        return 15000;
      case 15.0:
        return 10000;
      case 10.0:
        return 5000;
      case 5.0:
      default:
        return 1000;
    }
  }

  String getTokensTextByDuration(double duration) {
    if (duration >= 30) {
      return 'MAX';
    }

    return getTokensByDuration(duration).toString();
  }

  Widget renderDuration(int duration, Color color) {
    BorderRadius borderRadius = BorderRadius.zero;

    if (duration == 5) {
      borderRadius = const BorderRadius.only(
          topLeft: Radius.circular(10), bottomLeft: Radius.circular(10));
    } else if (duration == 30) {
      borderRadius = const BorderRadius.only(
          topRight: Radius.circular(10), bottomRight: Radius.circular(10));
    }

    BoxDecoration boxDecoration = BoxDecoration(
      color: color,
      borderRadius: borderRadius,
      border: Border.all(color: Colors.white),
    );

    return Expanded(
      child: Container(
        height: 50,
        decoration: boxDecoration,
        child: Center(
          child: Text(
            '${duration.toString()}s',
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'Digitalt',
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> renderDurations() {
    List<Widget> durations = [];

    for (int duration = 5; duration <= 30; duration += 5) {
      Color color = const Color(0xFF8ACB00);
      if (widget.game.storageController.magnetPowerDuration.value < duration) {
        color = const Color(0xFFCEDB9A);
      }

      durations = [
        ...durations,
        renderDuration(
          duration,
          color,
        ),
      ];
    }

    return durations;
  }

  Widget renderPowerupUpgradeLayout() {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Image.asset(
                  getPathFromAssetString(AssetConstants.magnet2x),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: renderDurations(),
                    ),
                  ),
                ),
              ],
            )),
        const SizedBox(
          height: 40,
        ),
        CustomAnimatedButton(
          height: 100,
          width: MediaQuery.of(context).size.width / 1.7,
          shadowHeight: 90,
          shadowWidth: MediaQuery.of(context).size.width / 1.7,
          imagePath: getPathFromAssetString(AssetConstants.earthToken),
          textColor: widget.storageController.score.value <
                  getTokensByDuration(magnetPowerDuration)
              ? Colors.grey
              : Colors.white,
          buttonText: getTokensTextByDuration(
              widget.storageController.magnetPowerDuration.value),
          shadowContainerColor: Constants.redButtonShadowContainerColor,
          containerColor: Constants.redButtonContainerColor,
          shineColor: Constants.redButtonShineColor,
          padding: const EdgeInsets.all(10.0),
          onTap: () {
            if (magnetPowerDuration >= 30) {
              return;
            }

            int tokensNeededToUpgrade =
                getTokensByDuration(magnetPowerDuration);
            if (widget.storageController.score.value < tokensNeededToUpgrade) {
              return;
            }
            widget.storageController.reduceScore(tokensNeededToUpgrade);
            widget.storageController
                .upgradeMagnetPowerDuration(magnetPowerDuration + 5);
            setState(() {
              magnetPowerDuration += 5;
            });
          },
          screenSize: MediaQuery.of(context).size,
        ),
      ],
    );
  }

  Widget renderTruckUpgradeLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 250,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(
                    getPathFromAssetString(AssetConstants.glow),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(
                    getPathFromAssetString(
                        'vehicle_skin_$selectedSkinIndex.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Skin(
              skinNumber: 1,
              onTap: () {
                setState(() {
                  selectedSkinIndex = 1;
                });
              },
              selectedSkinIndex: selectedSkinIndex,
              color: const Color(0xFFFFD217),
            ),
            Skin(
                skinNumber: 2,
                onTap: () {
                  setState(() {
                    selectedSkinIndex = 2;
                  });
                },
                selectedSkinIndex: selectedSkinIndex,
                color: const Color(0xFFFF6B00)),
            Skin(
              skinNumber: 3,
              onTap: () {
                setState(() {
                  selectedSkinIndex = 3;
                });
              },
              selectedSkinIndex: selectedSkinIndex,
              color: const Color(0xFF0039CC),
            ),
            Skin(
              skinNumber: 4,
              onTap: () {
                setState(() {
                  selectedSkinIndex = 4;
                });
              },
              selectedSkinIndex: selectedSkinIndex,
              color: const Color(0xFF7200CC),
            ),
            Skin(
              skinNumber: 5,
              onTap: () {
                setState(() {
                  selectedSkinIndex = 5;
                });
              },
              selectedSkinIndex: selectedSkinIndex,
              color: const Color(0xFFFF4E8C),
            ),
            Skin(
              skinNumber: 6,
              onTap: () {
                setState(() {
                  selectedSkinIndex = 6;
                });
              },
              selectedSkinIndex: selectedSkinIndex,
              color: const Color(0xFFFF2E00),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        CustomAnimatedButton(
          height: 60,
          width: MediaQuery.of(context).size.width / 1.7,
          shadowHeight: 50,
          shadowWidth: MediaQuery.of(context).size.width / 1.7,
          buttonText: appliedSkin == selectedSkinIndex ? 'SELECTED' : 'SELECT',
          shadowContainerColor: Constants.greenButtonShadowContainerColor,
          containerColor: Constants.greenButtonContainerColor,
          shineColor: Constants.greenButtonShineColor,
          padding: const EdgeInsets.all(10.0),
          onTap: () {
            setState(() {
              appliedSkin = selectedSkinIndex;
            });
            widget.storageController.updateVehicleSkin(selectedSkinIndex);
            widget.game.updateVehicle();
          },
          screenSize: MediaQuery.of(context).size,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
      ),
      child: Stack(
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height *
                          (selectedTab == 1 ? 0.6 : 0.5) +
                      6,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(
                      212,
                      175,
                      19,
                      1,
                    ),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height *
                      (selectedTab == 1 ? 0.6 : 0.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: const Color.fromRGBO(
                      251,
                      206,
                      19,
                      1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: selectedTab == 1
                                      ? const Color(0xFFFFD217)
                                      : const Color(0xFFD4AF13),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                  ),
                                  border: const Border(
                                    bottom: BorderSide(
                                      color: Color(0xFFD5AF10),
                                      width: 4.0,
                                    ),
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedTab = 1;
                                    });
                                  },
                                  child: const Center(
                                    child: Text(
                                      'TRUCK',
                                      style: TextStyle(
                                        fontSize: 27,
                                        color: Colors.white,
                                        fontFamily: 'Digitalt',
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          Expanded(
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                color: selectedTab == 2
                                    ? const Color(0xFFFFD217)
                                    : const Color(0xFFD4AF13),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                ),
                                border: const Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFD5AF10),
                                    width: 4.0,
                                  ),
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedTab = 2;
                                  });
                                },
                                child: const Center(
                                  child: Text(
                                    'UPGRADES',
                                    style: TextStyle(
                                      fontSize: 27,
                                      color: Colors.white,
                                      fontFamily: 'Digitalt',
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      selectedTab == 1
                          ? renderTruckUpgradeLayout()
                          : renderPowerupUpgradeLayout()
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.04,
              ),
              child: CustomAnimatedButton(
                height: MediaQuery.of(context).size.height / 13,
                width: MediaQuery.of(context).size.width / 6,
                shadowHeight: MediaQuery.of(context).size.height / 15,
                shadowWidth: MediaQuery.of(context).size.width / 6,
                screenSize: MediaQuery.of(context).size,
                onTap: () {
                  widget.game.overlays.remove(UpgradeOverlay.id);
                },
                imagePath: 'assets/images/close.png',
                shadowContainerColor: Constants.redButtonShadowContainerColor,
                containerColor: Constants.redButtonContainerColor,
                shineColor: Constants.redButtonShineColor,
                padding: const EdgeInsets.only(
                  left: 67.0,
                  top: 10.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
