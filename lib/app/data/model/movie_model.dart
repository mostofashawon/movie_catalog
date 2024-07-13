class MovieModel {
  int? id;
  String? originalTitle;
  String? posterPath;
  String? title;

  MovieModel({

    required this.id,
    required this.originalTitle,
    required this.posterPath,
    required this.title,
  });

  MovieModel copyWith({
    int? id,
    String? originalTitle,
    String? posterPath,
    String? title,
  }) =>
      MovieModel(
        id: id ?? this.id,
        originalTitle: originalTitle ?? this.originalTitle,
        posterPath: posterPath ?? this.posterPath,
        title: title ?? this.title,
      );

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    id: json["id"],
    originalTitle: json["original_title"],
    posterPath: json["poster_path"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "original_title": originalTitle,
    "poster_path": posterPath,
    "title": title,
  };
}
