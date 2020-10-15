import 'package:movies_app/core/models/tmdbItem.dart';
import 'package:movies_app/core/services/tmdbService.dart';

class TvShow extends TMDBItem{



  TvShow({
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
  TvShow fromJson(Map<String, dynamic> json) => TvShow(

      originalTitle : json['original_name'] ?? "",
      title : json['name'] ?? "",
      genreIds : [],
      overview : json['overview'] ?? "",
      releaseDate : json['first_air_date'] ?? "",
      voteAverage: double.parse(json['vote_average'].toString()),
  poster : TMDBService().createImageUrl(imageEndpoint: json['poster_path'])
  );



}