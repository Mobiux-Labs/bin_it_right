List<String> soundTypeToFilename(SfxType type) {
  switch (type) {
    case SfxType.coin:
      return const [
        'coin_collection.mp3',
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
  }
}

/// Allows control over loudness of different SFX types.
double soundTypeToVolume(SfxType type) {
  switch (type) {
    case SfxType.engineStart:
      return 0.7;
    case SfxType.coin:
    case SfxType.dryWaste:
    case SfxType.gameComplete:
    case SfxType.giftOpen:
    case SfxType.highScore:
    case SfxType.miss:
    case SfxType.rareItem:
    case SfxType.tap:
    case SfxType.wetWaste:
      return 1.0;
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
  wetWaste
}
