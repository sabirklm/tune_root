class Song {
  String title;
  String artist;
  String album;
  String genre;
  Duration duration;
  String albumArtUrl;
  String audioUrl;

  Song({
    required this.title,
    required this.artist,
    required this.album,
    required this.genre,
    required this.duration,
    required this.albumArtUrl,
    required this.audioUrl,
  });
}

class Playlist {
  String title;
  List<Song> songs;

  Playlist({
    required this.title,
    required this.songs,
  });
}

class Album {
  String title;
  String artist;
  String genre;
  String albumArtUrl;
  List<Song> songs;

  Album({
    required this.title,
    required this.artist,
    required this.genre,
    required this.albumArtUrl,
    required this.songs,
  });
}

class Artist {
  String name;
  String bio;
  String profileImageUrl;
  List<Album> albums;
  List<Song> songs;

  Artist({
    required this.name,
    required this.bio,
    required this.profileImageUrl,
    required this.albums,
    required this.songs,
  });
}

class User {
  String name;
  String email;
  String profileImageUrl;
  List<Playlist> playlists;

  User({
    required this.name,
    required this.email,
    required this.profileImageUrl,
    required this.playlists,
  });
}
