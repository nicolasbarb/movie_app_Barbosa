import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  ItemCard({Key key, this.image}) : super(key: key);
  
  final String image;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
      child: Image.network(image,
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
    );
  }
}
