

import 'dart:convert'as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled55/uatility/api.dart';
import 'package:untitled55/models/post.dart';


class postAPI{
  List <Post> post1 = List<Post>();
  Future<List<Post>> FetchbyCategoryId( String id) async{

    String whatNewApi = base_api+catogries_api+id;
    var response = await http.get(whatNewApi);
    if(response.statusCode==200){

      var T = convert.jsonDecode(response.body);
      var data = T['data'];
      for( var item in data){
        Post post = Post(
            id: item["id"].toString(),
            title: item["title"].toString(),
            content: item["content"].toString(),
            dateWritten: item["date_written"].toString(),
            featuredImage: item["featured_image"].toString(),
            votesUp: item["votes_up"],
            votesDown: item["votes_down"],
            votersUp: (item["voters_up"] == null) ? List<int>() : jsonDecode( item["voters_up"] ),
            votersDown: (item["voters_down"] == null) ? List<int>() : jsonDecode( item["voters_down"] ),
            userId: item["user_id"],
            categoryId: item["category_id"]

        );
        post1.add(post);


      }

    }
    return post1;
   // return []; to test >>

  }


}