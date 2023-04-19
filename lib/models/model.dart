var audioUrl =
    "https://cdn.pixabay.com/download/audio/2022/03/24/audio_d48b982c8e.mp3?filename=flute_78_d-104176.mp3";

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

class Category {
  final String title;
  final String imgUrl;

  Category({
    required this.title,
    required this.imgUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: json['title'] as String,
      imgUrl: json['imgUrl'] as String,
    );
  }
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

class ErrorResponse {
  final String errorMessage;
  final int errorCode;
  final dynamic apiResponse;

  ErrorResponse({
    required this.errorMessage,
    required this.errorCode,
    this.apiResponse,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      errorMessage: json['errorMessage'] as String,
      errorCode: json['errorCode'] as int,
      apiResponse: json['response'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'errorMessage': errorMessage,
      'errorCode': errorCode,
      'response': apiResponse
    };
  }

  @override
  String toString() {
    return 'ErrorResponse{errorMessage: $errorMessage, errorCode: $errorCode}';
  }
}
