import 'dart:convert' as convert;
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:movies_app/core/models/movie.dart';
import 'package:movies_app/core/models/tvShow.dart';

class TMDBService {

  static String popularMovie = "popular";
  static String upComingMovie = "upcoming";
  static String topRatedMovie = "top_rated";
  static String popularTvShow = "popular";


  String apiKeyV3 = "a936a74485fd81f85cd67e773cec9cd8";
  String apiKeyV4 = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOTM2YTc0NDg1ZmQ4MWY4NWNkNjdlNzczY2VjOWNkOCIsInN1YiI6IjVjOGJhMTdmOTI1MTQxMDQ2MmMyMjQ4YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XPQcbEklne8baZFGIWDSxv8Jj8zdTe9qfxCsYr38Ilc";
  String baseUrl = "https://api.themoviedb.org/3";
  String imageUrl = "https://image.tmdb.org/t/p/";

  String _createRequest(String endpoint) => "$baseUrl$endpoint?api_key=$apiKeyV3";

  String createImageUrl({String size = "w500", String imageEndpoint}) => "$imageUrl/$size$imageEndpoint";

  Future<List<Movie>> getTMDBMovieList<T>(String type) async {
    String url = _createRequest("/movie/$type");

    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      List<Movie> list = jsonResponse['results'].map<Movie>((iteration) => Movie().fromJson(iteration)).toList();

      return list;

    } else {
      print('Request failed with status: ${response.statusCode}. ${response.body}');
    }
    return [];

  }

  Future<List<TvShow>> getTMDBTvShowList<T>(String type) async {
    String url = _createRequest("/tv/$type");

    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = convert.jsonDecode(response.body);
      List<TvShow> list = jsonResponse['results'].map<TvShow>((iteration) => TvShow().fromJson(iteration)).toList();

      return list;

    } else {
      print('Request failed with status: ${response.statusCode}. ${response.body}');
    }
    return [];

  }
}