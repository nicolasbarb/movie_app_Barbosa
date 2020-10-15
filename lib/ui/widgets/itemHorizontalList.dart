import 'package:flutter/material.dart';


typedef ItemHorizontalListBuilder<T> = Widget Function(BuildContext context, T item);

class ItemHorizontalList<T> extends StatelessWidget {
  ItemHorizontalList({Key key, this.future, this.itemBuilder}) : super(key: key);

  final Future<List<T>> future;
  final ItemHorizontalListBuilder<T> itemBuilder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<T>>(
      future: future,
      builder: (context, snapshot){
        if(snapshot.hasError){
          print(snapshot.error);
        }

        if(snapshot.hasData){
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return itemBuilder(context, snapshot.data[index]);
              }
          );
        }
        return Text("");
      },
    );
  }
}
