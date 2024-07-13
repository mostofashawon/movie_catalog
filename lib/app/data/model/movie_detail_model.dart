class MovieDetailModel {

  List<Genre>? genres;
  int? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  int? runtime;
  String? status;
  String? title;
  double? voteAverage;
  int? voteCount;

  MovieDetailModel({
     this.genres,
     this.id,
     this.originalTitle,
     this.overview,
     this.posterPath,
     this.releaseDate,
     this.runtime,
     this.status,
     this.title,
     this.voteAverage,
     this.voteCount,
  });

  MovieDetailModel copyWith({

    List<Genre>? genres,
    int? id,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    int? revenue,
    int? runtime,
    String? status,
    String? title,
    double? voteAverage,
    int? voteCount,
  }) =>
      MovieDetailModel(

        genres: genres ?? this.genres,
        id: id ?? this.id,

        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        posterPath: posterPath ?? this.posterPath,
        releaseDate: releaseDate ?? this.releaseDate,
        runtime: runtime ?? this.runtime,
        status: status ?? this.status,
        title: title ?? this.title,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) => MovieDetailModel(

    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    id: json["id"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    posterPath: json["poster_path"],
    releaseDate: json["release_date"],
    runtime: json["runtime"],
    status: json["status"],
    title: json["title"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
    "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
    "id": id,
    "original_title": originalTitle,
    "overview": overview,

    "poster_path": posterPath,
    "release_date": releaseDate,
    "runtime": runtime,
    "status": status,
    "title": title,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  Genre copyWith({
    int? id,
    String? name,
  }) =>
      Genre(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

