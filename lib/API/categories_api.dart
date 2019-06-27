

import 'package:untitled55/models/categoriy.dart';
import 'dart:convert'as convert;
import 'package:http/http.dart' as http;
import 'package:untitled55/uatility/api.dart';

class CategoriesAPI{


  Future<List<Catogriey>> fetchCatogries()async{
    List catofriey1 = List<Catogriey>();

    String AllCatogriesApi = base_api +All_Catogries_Api;
    var response = await http.get(AllCatogriesApi);
    if (response.statusCode == 200){

      var T = convert.jsonDecode(response.body);
      var data = T['data'];
      for( var item in data){
        Catogriey cato = Catogriey(item['id'].toString(), item['title'].toString());
        catofriey1.add(cato);
        print(cato.title);
      }
    }
    return catofriey1;

}
}