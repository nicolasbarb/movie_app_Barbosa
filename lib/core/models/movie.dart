import 'package:flutter/cupertino.dart';
import 'package:movies_app/core/models/tmdbItem.dart';
import 'package:movies_app/core/services/tmdbService.dart';

class Movie extends TMDBItem{


  Movie({
    title,
    originalTitle,
    releaseDate,
    poster,
    genreIds,
    overview,
    voteAverage}) : super(
    title: title,
    originalTitle: originalTitle,
    releaseDate: releaseDate,
    poster: poster,
    genreIds: genreIds,
    overview: overview,
    voteAverage: voteAverage
  );

  @override
  Movie fromJson(Map<String, dynamic> json) => Movie(

      originalTitle : json['original_title'] ?? "",
      title : json['title'] ?? "",
      genreIds : [],
      overview : json['overview'] ?? "",
      releaseDate : json['release_date'] ?? "",
      voteAverage: double.parse(json['vote_average'].toString()),
      poster : TMDBService().createImageUrl(imageEndpoint: json['poster_path'])
  );


}