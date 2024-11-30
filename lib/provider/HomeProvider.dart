import 'package:flutter/material.dart';
import 'package:re_advance_flutter_exam/Apihepler/apiHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modal/modalClass.dart';

class Homeprovider extends ChangeNotifier{

  late List<Shopping> shopList=[];
   List<Shopping>? shopListSave=[];
   List<String> addList=[];
   String search='All';

   double total=0;
   int selectedindex=0;
   bool check=true;
   Future<List<Shopping>> fetchdataFromApi()
   async {
     final data= await ApiHelper.apiHelper.fetchData();
     shopList=data.map((e) => Shopping.fromJson(e),).toList();
     return shopList;

   }



   void adddata(int price ,int index)
   {

       addList.add('$price $index');
       bookMar();
       totalAmount();
       notifyListeners();

   }

   void removeList(int index)
   {
     addList.removeAt(index);
     bookMar();
     totalAmount();
     notifyListeners();
   }

   Homeprovider()
   {
     fetchdataFromApi();
     getBookMark();
   }

   Future<void> bookMar()
   async {
     SharedPreferences preferences=await SharedPreferences.getInstance();
     preferences.setStringList('book',addList);
     notifyListeners();
   }
  Future<void> getBookMark()
  async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
   addList= preferences.getStringList('book')??[];
    notifyListeners();
  }

  void totalAmount()
  {
    dynamic amount=0;
    for(int i=0;i<addList.length;i++)
      {
        amount=amount+shopListSave![int.parse(addList[i].split(" ").sublist(0,1).join(" "))].price;
      }
    total=amount;
    notifyListeners();
  }
}