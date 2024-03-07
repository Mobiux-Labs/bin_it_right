List<String> soundTypeToFilename(SfxType type) {
  switch (type) {
    case SfxType.coin:
      return const [
        'coins.wav',
      ];
  }
}

/// Allows control over loudness of different SFX types.
double soundTypeToVolume(SfxType type) {
  switch (type) {
    case SfxType.coin:
      return 1.0;
  }
}

enum SfxType {
  coin,
}
