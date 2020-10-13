import 'package:flutter/material.dart';
import 'package:movies_app/core/models/movie.dart';
import 'package:movies_app/ui/pages/detailMovie.dart';
import 'package:movies_app/ui/widgets/movieCard.dart';

class ItemHorizontalList extends StatelessWidget {
  ItemHorizontalList({Key key, this.movieList}) : super(key: key);

  final List<Movie> movieList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(10),
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index) {
          var movie = movieList[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => DetailMovie(
                  name: movieList[index].name,
                image: movieList[index].image,)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: MovieCard(
                image: movie.image,
              ),
            ),
          );
        }
    );
  }
}
