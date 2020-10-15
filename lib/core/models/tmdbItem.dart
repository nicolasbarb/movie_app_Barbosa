import 'package:movies_app/core/services/tmdbService.dart';

abstract class TMDBItem {


  int id;
  double popularity;
  bool video;
  String originalTitle;
  String title;
  List<dynamic> genreIds;
  String overview;
  double voteAverage;
  String releaseDate;
  String poster;


  TMDBItem({
      this.id,
      this.popularity,
      this.video,
      this.originalTitle,
      this.title,
      this.genreIds,
      this.overview,
      this.voteAverage,
      this.releaseDate,
      this.poster
  });


  TMDBItem fromJson(Map<String, dynamic> json);

  String getYear() => DateTime.parse(releaseDate).year.toString();
}
