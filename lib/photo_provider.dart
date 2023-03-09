import 'package:flutter/cupertino.dart';
import 'package:provider_api/photo_model.dart';
import 'package:provider_api/repository.dart';

class PhotoProvider extends ChangeNotifier{
  List<PhotoModel> data = [];

  loadData() async{
    try{
      var temp = await Repository.fetchData();
      if(temp != null){
        data = temp;
      }
      notifyListeners();
    }catch(e){
      throw e.toString();
    }
  }

}