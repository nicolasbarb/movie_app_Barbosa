import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/services/tmdbService.dart';
import 'package:movies_app/ui/widgets/itemHorizontalList.dart';

class HomePage extends StatelessWidget {


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
              child: InkWell(
                onTap: () {TMDBService().getTMDBList(TMDBService.popular);},
                  child: Text("Popular Movies",
                    style: TextStyle(color: Colors.white,
                        fontSize: 25),
                  )
              ),
            ),
            Container(
              height: 150,
                child: ItemHorizontalList(type: TMDBService.popular,)
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Popular TV Shows", style: TextStyle(color: Colors.white, fontSize: 25),),
            ),
            Container(
              height: 150,
                child: ItemHorizontalList(type: TMDBService.topRated,)

            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("Best Movies", style: TextStyle(color: Colors.white, fontSize: 25),),
            ),
            Container(
              height: 150,
              child: ItemHorizontalList(type: TMDBService.upComing,)
            ),
          ],
        ),
      ),
    );
  }
}
