import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieStyleCard extends StatelessWidget {
  MovieStyleCard({Key key, this.color, this.height, this.width, this.text}) : super(key: key);

  final Color color;
  final double height;
  final double width;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5)
      ),
      height: height,
      width: width,
      child: Center(child: text),
    );
  }
}
