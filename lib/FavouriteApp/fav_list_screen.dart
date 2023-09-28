import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/FavouriteApp/fav_provider.dart';

class FavListScreen extends StatefulWidget {
  const FavListScreen({super.key});

  @override
  State<FavListScreen> createState() => _FavListScreenState();
}

class _FavListScreenState extends State<FavListScreen> {
  @override
  Widget build(BuildContext context) {
    // print("build");
    final favListProvider = Provider.of<FavProvider>(context , listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Fav Items List"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favListProvider.favList.length,
              itemBuilder: (context, index) {
                return Consumer<FavProvider>(
                    builder:(context, value, child) {
                      return ListTile(
                        title: Text(
                            "Item " + favListProvider.favList[index].toString()
                        ),
                        trailing: Icon(Icons.favorite),
                        onTap: () {
                          if(favListProvider.favList.contains(favListProvider.favList[index])){
                            favListProvider.removeItem(favListProvider.favList[index]);
                          }
                          // 2  0
                          // 4  1
                          // 3  2
                        },
                      );
                    },

                );
              }
            ),
          )
        ],
      ),
    );
  }
}
