import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/models/movie.dart';
import 'package:movies_app/core/models/tvShow.dart';
import 'package:movies_app/core/services/tmdbService.dart';
import 'package:movies_app/ui/pages/detailItem.dart';
import 'package:movies_app/ui/widgets/itemHorizontalList.dart';
import 'package:movies_app/ui/widgets/movieCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  final tmbdService = TMDBService();
  double exitButtonPosition = 30;
  AnimationController iconAnimation;
  bool isPlaying = false;


  @override
  void initState() {
    // TODO: implement initState
    iconAnimation = AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    super.initState();
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      if(isPlaying){
        iconAnimation.forward();
        exitButtonPosition = 130;
      }
      else {
        iconAnimation.reverse();
        exitButtonPosition = 30;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var firebaseAuth = context.watch<FirebaseAuth>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
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
                                  tmdbItem: movie)),
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
                                  tmdbItem: tvshow)),
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
                    child: ItemHorizontalList(future: tmbdService.getTMDBTvShowList(TMDBService.popularTvShow),
                      itemBuilder: (BuildContext context, TvShow tvshow) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(builder: (_) => DetailItem(
                                  tmdbItem: tvshow)),
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
              ],
            ),
            AnimatedPositioned(
              bottom: exitButtonPosition,
              right: 30,
              duration: Duration(milliseconds: 200),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: IconButton(
                  onPressed: () async => {
                  await firebaseAuth.signOut(),
                    Navigator.pop(context)
                },
                  icon: Icon(Icons.coronavirus,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 30,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: IconButton(
                  onPressed: () => _handleOnPressed(),
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: iconAnimation,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
