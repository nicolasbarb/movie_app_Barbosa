import 'package:movies_app/core/services/tmdbService.dart';

class TvShow {
  int id;
  double popularity;
  bool video;
  String originalName;
  String name;
  List<int> genreIds;
  String overview;
  int voteAverage;
  String releaseDate;
  String poster;


  TvShow(this.id, this.popularity, this.video, this.originalName, this.name,
      this.genreIds, this.overview, this.voteAverage, this.releaseDate, this.poster);

  TvShow.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        popularity = json['popularity'] ?? null,
        video = json['video'] ?? false,
        originalName = json['originalName'] ?? "",
        name = json['name'] ?? "",
        genreIds = json['genreIds'] ?? [],
        overview = json['overview'] ?? "",
        voteAverage = json['voteAverage'] ?? null,
        releaseDate = json['releaseDate'] ?? "",
        poster = TMDBService().createImageUrl(imageEndpoint: json['poster_path']);

}