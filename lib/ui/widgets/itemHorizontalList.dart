import 'package:flutter/material.dart';
import 'package:movies_app/core/models/movie.dart';
import 'package:movies_app/core/services/tmdbService.dart';
import 'package:movies_app/ui/pages/detailMovie.dart';
import 'package:movies_app/ui/widgets/movieCard.dart';

class ItemHorizontalList extends StatelessWidget {
  ItemHorizontalList({Key key, this.type}) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: TMDBService().getTMDBList(type),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(builder: (_) => DetailMovie(
                        movie: snapshot.data[index])),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: MovieCard(
                      image: snapshot.data[index].poster,
                    ),
                  ),
                );
              }
          );
        }
        return Text("");


      },
    );
  }
}
