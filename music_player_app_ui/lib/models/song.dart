class Song {
  final String title;
  final String artistName;
  final String picturePath;
  final String songPath;
  final List categories;
  final int likes;
  final String timestap;

  Song({
    required this.title,
    required this.artistName,
    required this.picturePath,
    required this.songPath,
    required this.categories,
    required this.likes,
    required this.timestap,
  });

  static List getSorted(String sortedBy) {
    List songs = getSongs();
    switch (sortedBy) {
      case 'popular':
        songs.sort((a, b) => b.likes.compareTo(a.likes));
      default:
        songs.sort((a, b) => a.likes.compareTo(b.likes));
    }
    return songs;
  }

  static List getSongs() {
    List songs = [];
    songs.add(
      Song(
        title: 'title 1',
        artistName: 'artist 1',
        picturePath: 'assets/images/artistpicture1.jpg',
        songPath: 'songs/nose.mp3',
        categories: ['rock', 'mas', 'mas'],
        likes: 23,
        timestap: DateTime.now().toString(),
      ),
    );

    songs.add(
      Song(
        title: 'title 2',
        artistName: 'artist 2',
        picturePath: 'assets/images/artistpicture2.jpg',
        songPath: 'songs/nose.mp3',
        categories: ['relax', 'rain', 'mas'],
        likes: 24,
        timestap: DateTime.now().toString(),
      ),
    );

    songs.add(
      Song(
        title: 'title 3',
        artistName: 'artist 3',
        picturePath: 'assets/images/artistpicture3.jpg',
        songPath: 'songs/nose.mp3',
        categories: ['party', 'rock'],
        likes: 100,
        timestap: DateTime.now().toString(),
      ),
    );

    songs.add(
      Song(
        title: 'title 4',
        artistName: 'artist 4',
        picturePath: 'assets/images/artistpicture4.jpg',
        songPath: 'songs/nose.mp3',
        categories: ['sad', 'rain'],
        likes: 80,
        timestap: DateTime.now().toString(),
      ),
    );

    return songs;
  }
}
