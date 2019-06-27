
import 'package:untitled55/models/author.dart';
import 'package:untitled55/uatility/api.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class AuthorsAPI{

  Future < List<Author> >fetchAllAuthors()async{
    List author1 = List<Author>();
    String allAuthorsApi=base_api + all_Authors_Api;
    var response= await http.get(allAuthorsApi);

    if(response.statusCode==200){


      var T = convert.jsonDecode(response.body);//لتحويل البيانات من سترنغ الى جسون
      var data = T['data'];
      for ( var item in data){
        Author author = Author(item['id'].toString(), item['name'].toString(), item['email'].toString(), item['avatar'].toString());
        author1.add(author);
      }

    }
    return author1;
  }
}