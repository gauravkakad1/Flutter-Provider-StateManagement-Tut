import 'package:flutter/foundation.dart';

class FavProvider with ChangeNotifier{

  List<int> _favList = [];
  List <int> get favList => _favList;

  void addItem(value){
    _favList.add(value);
    notifyListeners();
  }
  void removeItem(value){
    _favList.remove(value);
    notifyListeners();
  }



}
