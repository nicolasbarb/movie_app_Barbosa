import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/models/movie.dart';
import 'package:movies_app/core/models/tvShow.dart';
import 'package:movies_app/core/services/tmdbService.dart';
import 'package:movies_app/ui/pages/detailMovie.dart';
import 'package:movies_app/ui/widgets/itemHorizontalList.dart';
import 'package:movies_app/ui/widgets/movieCard.dart';

class HomePage extends StatelessWidget {

  final tmbdService = TMDBService();
  
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
              child: Text("Popular Movies",
                style: TextStyle(color: Colors.white,
                    fontSize: 25),
              ),
            ),
            Container(
              height: 150,
                child: ItemHorizontalList(future: tmbdService.getTMDBMovieList(TMDBService.popularMovie),
                  itemBuilder: (BuildContext context, Movie movie) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(builder: (_) => DetailItem(
                              movie: movie)),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: ItemCard(
                          image: movie.poster,
                        ),
                      ),
                    );
                  },
                )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Popular TV Shows", style: TextStyle(color: Colors.white, fontSize: 25),),
            ),
            Container(
              height: 150,
                child: ItemHorizontalList(future: tmbdService.getTMDBTvShowList(TMDBService.popularTvShow),
                  itemBuilder: (BuildContext context, TvShow tvshow) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(builder: (_) => DetailItem(
                              movie: tvshow)),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: ItemCard(
                          image: tvshow.poster,
                        ),
                      ),
                    );
                  },
                )

            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Best Movies", style: TextStyle(color: Colors.white, fontSize: 25),),
            ),
            Container(
              height: 150,
              child: ItemHorizontalList(future: tmbdService.getTMDBMovieList(TMDBService.popularMovie),
              )
            ),
          ],
        ),
      ),
    );
  }
}
