import 'package:flutter/material.dart';
import 'package:movies_app/core/models/movie.dart';
import 'package:movies_app/ui/shared/sizeConfig.dart';
import 'package:movies_app/ui/widgets/movieStyleCard.dart';

class DetailItem extends StatelessWidget {
  DetailItem({Key key, this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: SizeConfig.screenWidth,
                child: Image.network(movie.poster,
                  loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null ?
                        loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Colors.transparent],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, 100)
                );
              },
              blendMode: BlendMode.dstIn,
              child: Container(
                color: Colors.black,
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight / 1.85,
              ),
            ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight / 2,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 40
                    ),
                    ),
                    Row(
                      children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text("15+",                    style: TextStyle(
                                color: Colors.white,
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text("2020",                     style: TextStyle(
                                color: Colors.white,
                            ),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Icon(Icons.star, color: Colors.orange, size: 15,),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text("7.6",                     style: TextStyle(
                                color: Colors.orange,
                            ),),
                          )

                        ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Wrap(
                        direction: Axis.horizontal,
                        spacing: 8,
                        children: [
                          MovieStyleCard(color: Colors.white, height: 30, width: 50, text: Text("Crime", style: TextStyle(fontWeight: FontWeight.bold),)),
                          MovieStyleCard(color: Colors.white, height: 30, width: 50, text: Text("Drama", style: TextStyle(fontWeight: FontWeight.bold),)),
                          MovieStyleCard(color: Colors.white, height: 30, width: 70, text: Text("Mystery", style: TextStyle(fontWeight: FontWeight.bold),))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: RichText(
                        text: TextSpan(
                            text: "Cast: ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(text: movie.genreIds.length.toString(), style: TextStyle(fontWeight: FontWeight.normal))
                            ]
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text("Summary", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(movie.overview,
                        style: TextStyle(
                            color: Colors.white,
                        ),),
                    )
                  ],
                ),
              )
            ),
          ],
        ),
    );
  }
}
