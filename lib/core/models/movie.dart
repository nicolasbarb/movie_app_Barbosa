import 'package:flutter/cupertino.dart';
import 'package:movies_app/core/services/tmdbService.dart';

class Movie {
  

  int id;
  double popularity;
  bool video;
  String originalTitle;
  String title;
  List<int> genreIds;
  String overview;
  int voteAverage;
  String releaseDate;
  String poster;


  Movie(this.id, this.popularity, this.video, this.originalTitle, this.title,
      this.genreIds, this.overview, this.voteAverage, this.releaseDate, this.poster);

  Movie.fromJson(Map<String, dynamic> json)
        : id = json['id'],
        popularity = json['popularity'] ?? null,
        video = json['video'] ?? false,
        originalTitle = json['originalTitle'] ?? "",
        title = json['title'] ?? "",
        genreIds = json['genreIds'] ?? [],
        overview = json['overview'] ?? "",
        voteAverage = json['voteAverage'] ?? null,
        releaseDate = json['releaseDate'] ?? "",
        poster = TMDBService().createImageUrl(imageEndpoint: json['poster_path']);


}