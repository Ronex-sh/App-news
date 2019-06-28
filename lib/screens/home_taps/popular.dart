import 'package:flutter/material.dart';
import 'package:untitled55/API/post_api.dart';
import 'package:untitled55/models/post.dart';
//import 'dart:async';

import 'package:untitled55/uatility/data_uatility.dart';

import '../single_post.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {

  postAPI postApi = postAPI();
  @override

  Widget build(BuildContext context) {
    return
        FutureBuilder(future: postApi.FetchbyCategoryId('3'),
        builder: (context , AsyncSnapshot snapShot ){


              switch(snapShot.connectionState){

                case ConnectionState.none:
                  return conectionerror();

                  break;


                case ConnectionState.waiting:
                  return loading();

                  break;
                case ConnectionState.active:
                  return loading();

                  break;

                case ConnectionState.done:

                  if (snapShot.hasError){
                    return error(snapShot.error);
                  }else{
                    List<Post> posts = snapShot.data;
                    return
                    ListView.builder(itemBuilder: (context,pos){


                      return Card(
                        child: _DrawSingleRow( posts[pos]),
                      );

                    },itemCount: posts.length,);

                  }
                  break;




              }



        },

        );
  }
  Widget _DrawSingleRow(Post post) {
    return

      Padding(padding: EdgeInsets.all(0.1),
        child: Card(
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onDoubleTap: (){

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return
                  Singlepost(post);
                }));
              },
              child: Row(
                children: <Widget>[
                  SizedBox(height: 100, width: 120,
                      child: Image(
                        image: NetworkImage(post.featuredImage),
                        fit: BoxFit.cover,)),
                  SizedBox(width: 12,),

                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(post.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),),
                        SizedBox(height: 12,),
                        Row(
                          children: <Widget>[
                            Text(' helo lej ld d'),
                            SizedBox(width: 110,),

                            Row(
                              children: <Widget>[
                                Icon(Icons.timer),
                                Text('56 m')
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }


}
///////////