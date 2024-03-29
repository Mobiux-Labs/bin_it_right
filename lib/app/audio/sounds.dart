List<String> soundTypeToFilename(SfxType type) {
  switch (type) {
    case SfxType.coin:
      return const [
        'coin.mp3',
      ];
    case SfxType.dryWaste:
      return const [
        'dry_waste.mp3',
      ];
    case SfxType.engineStart:
      return const [
        'engine_start.mp3',
      ];
    case SfxType.gameComplete:
      return const [
        'game_complete.mp3',
      ];
    case SfxType.giftOpen:
      return const [
        'gift_open.mp3',
      ];
    case SfxType.highScore:
      return const [
        'high_score.mp3',
      ];
    case SfxType.miss:
      return const [
        'miss.mp3',
      ];
    case SfxType.rareItem:
      return const [
        'rare_item.mp3',
      ];
    case SfxType.tap:
      return const [
        'tap.mp3',
      ];
    case SfxType.wetWaste:
      return const [
        'wet_waste.mp3',
      ];
    case SfxType.boxOpen:
      return const [
        'gift_open.mp3',
      ];
    case SfxType.boxCollect:
      return const [
        'box_collect.mp3',
      ];
    case SfxType.powerup:
      return const [
        'powerup.mp3',
      ];
  }
}

/// Allows control over loudness of different SFX types.
double soundTypeToVolume(SfxType type) {
  switch (type) {
    case SfxType.engineStart:
    case SfxType.coin:
      return 0.1;
    case SfxType.dryWaste:
    case SfxType.gameComplete:
    case SfxType.giftOpen:
    case SfxType.highScore:
    case SfxType.miss:
    case SfxType.rareItem:
    case SfxType.tap:
    case SfxType.wetWaste:
    case SfxType.powerup:
    case SfxType.boxCollect:
    case SfxType.boxOpen:
      return 0.5;
  }
}

enum SfxType {
  coin,
  dryWaste,
  engineStart,
  gameComplete,
  giftOpen,
  highScore,
  miss,
  rareItem,
  tap,
  wetWaste,
//
  boxCollect,
  boxOpen,
  powerup
}
