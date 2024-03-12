const Set<Song> songs = {
  // Filenames with whitespace break package:audioplayers on iOS
  // (as of February 2024), so we use no whitespace.
  Song('music_1.mp3', 'bg_music_1'),
};

class Song {
  final String filename;

  final String name;

  const Song(this.filename, this.name);

  @override
  String toString() => 'Song<$filename>';
}
