import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/FavouriteApp/fav_list_screen.dart';
import 'package:provider_tutorials/FavouriteApp/fav_provider.dart';

class FavHomeScreen extends StatefulWidget {
  const FavHomeScreen({super.key});

  @override
  State<FavHomeScreen> createState() => _FavHomeScreenState();
}

class _FavHomeScreenState extends State<FavHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavProvider>(context , listen: true);
  return Scaffold(
      appBar: AppBar(
        title: Text("Favourite App"),
        actions: [
          

          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FavListScreen()));
            },
              child: Center(
                child: Consumer<FavProvider>(
                  builder: (context, value, child) {
                    return Badge(
                        label: Text(value.favList.length.toString()),
                        child: Icon(Icons.favorite)
                    );
                  },
                ),
              ),
          ),
          SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        title: Text("Item "+index.toString(),
                          style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),
                        ),
                        onTap: (){
                          if(favProvider.favList.contains(index)){
                            favProvider.removeItem(index);
                          }
                          else{
                            favProvider.addItem(index);
                          }
                        },
                        trailing: favProvider.favList.contains(index)?Icon(Icons.favorite):Icon(Icons.favorite_border_outlined),
                      );
                    },

                  );
                },
            ),
          ),
        ],
      ),
    );
  }
}
