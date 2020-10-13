import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  MovieCard({Key key, this.image}) : super(key: key);
  
  final String image;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
      child: Image(image: AssetImage(image))),
    );
  }
}
