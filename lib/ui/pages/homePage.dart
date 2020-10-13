import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/models/movie.dart';
import 'package:movies_app/ui/pages/detailMovie.dart';
import 'package:movies_app/ui/widgets/itemHorizontalList.dart';
import 'package:movies_app/ui/widgets/movieCard.dart';

class HomePage extends StatelessWidget {

  final List<Movie> popularMovieList = [Movie(name: "Enola Holmes", image: "assets/images/enola.jpg"),
    Movie(name: "Enola Holmes", image: "assets/images/enola.jpg"),
    Movie(name: "Enola Holmes", image: "assets/images/enola.jpg"),];


  final List<Movie> popularTVShow = [Movie(name: "Enola Holmes", image: "assets/images/enola.jpg"),
    Movie(name: "Enola Holmes", image: "assets/images/enola.jpg"),
    Movie(name: "Enola Holmes", image: "assets/images/enola.jpg"),];

  final List<Movie> bestMovies = [Movie(name: "Enola Holmes", image: "assets/images/enola.jpg"),
    Movie(name: "Enola Holmes", image: "assets/images/enola.jpg"),
    Movie(name: "Enola Holmes", image: "assets/images/enola.jpg"),];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Popular Movies", style: TextStyle(color: Colors.white, fontSize: 25),),
            ),
            Container(
              height: 150,
                child: ItemHorizontalList(movieList: popularMovieList,)
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Popular TV Shows", style: TextStyle(color: Colors.white, fontSize: 25),),
            ),
            Container(
              height: 150,
                child: ItemHorizontalList(movieList: popularTVShow,)

            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Best Movies", style: TextStyle(color: Colors.white, fontSize: 25),),
            ),
            Container(
              height: 150,
              child: ItemHorizontalList(movieList: bestMovies,)
            ),
          ],
        ),
      ),
    );
  }
}
