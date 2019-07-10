import 'dart:math';

import 'package:flutter/material.dart';

import 'package:untitled55/API/post_api.dart';
//import 'dart:async';
import 'package:untitled55/models/post.dart';
//import 'package:timeago/timeago.dart';
import 'package:untitled55/uatility/data_uatility.dart';

import '../single_post.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  postAPI postsAPI = postAPI();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawheader(),
          _drawTopstories(),
          _DrawResentUpdate(),
        ],
      ),
    );
  }

  Widget _drawheader() {
    TextStyle _headerTatle = TextStyle(
      color: Colors.white,
      fontSize: 23,
      fontWeight: FontWeight.w600,
    );
    TextStyle _headerDescrption = TextStyle(
      color: Colors.white,
      fontSize: 17,
    );
    return FutureBuilder(
      future: postsAPI.FetchbyCategoryId("6"),
      builder: (context , AsyncSnapshot snapshot){

    switch(snapshot.connectionState) {
      case ConnectionState.waiting:
        return loading();

        break;
      case ConnectionState.active:
        return loading();

        break;

      case ConnectionState.none:

        return conectionerror();

        break;

      case ConnectionState.done:
        if(snapshot.error != null) {
          return error(snapshot.error);


        }else{
          List<Post> posts = snapshot.data;
          Random random = Random();
          int randomindx = random.nextInt(posts.length);

          Post postes = posts[randomindx];
          return

          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return SinglePost(postes);


              }));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.29,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(postes.featuredImage),
                      fit: BoxFit.fill)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 48, right: 48),
                      child: Text(
                        postes.title,
                        style: _headerTatle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: Text(
                        postes.content.substring(0,80),
                        style: _headerDescrption,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );


        }
        break;
    }


      },
    );
  }

  Widget _drawTopstories() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 10),
            child: _drawsecthuontitle('Top stories'),
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Card(
              child: FutureBuilder(
                future: postsAPI.FetchbyCategoryId('1'),
                builder: (BuildContext context, AsyncSnapshot snapShot) {

                  switch(snapShot.connectionState){
                    case ConnectionState.waiting:
                      return loading();

                      break;
                    case ConnectionState.active:
                      return loading();

                      break;

                    case ConnectionState.none:
                      // todo has problem
                        return conectionerror();

                      break;

                    case ConnectionState.done:
                      if(snapShot.error != null){
                        return error(snapShot.error);

                        // todo  handle error
                      }else {
                        if(snapShot.hasData){
                          List<Post>posts = snapShot.data;
                          if(posts.length >= 3){

                            Post post1 = snapShot.data[0];
                            Post post2 = snapShot.data[1];
                            Post post3 = snapShot.data[2];

                            return Column(
                              children: <Widget>[
                                _DrawSingleRow(post1),
                                _DrawSingleRow(post2),
                                _DrawSingleRow(post3),
                              ],
                            );

                          }else{

                            return nodata();
                          }

                        }else{

                          return nodata();

                          // todo handle no data
                        }

                      }

                      break;

                  }



                },
              ),
            ),
          ),
        ],
      ),
    );
  }




  Widget _DrawResentUpdate() {
    return Padding(
      padding: EdgeInsets.all(8),



      child: FutureBuilder(
        future: (postsAPI.FetchbyCategoryId('2')),
        builder: (context ,AsyncSnapshot snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return conectionerror();

              break;

            case ConnectionState.active:
              return loading();
              break;
            case ConnectionState.waiting:
              return loading();
              break;

            case ConnectionState.done:
              if(snapshot.hasError){
                return error(snapshot.error);


              }else{
                return
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 4, top: 8, bottom: 8),
                        child: _drawsecthuontitle('recent update'),
                      ),
                      _drawRecentcard(Colors.purple,snapshot.data[1]),
                      _drawRecentcard(Colors.deepOrange,snapshot.data[2]),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  );


              }
              break;
          }


        }
      ),
    );
  }

  _drawsecthuontitle(String t) {
    return Text(
      t,
      style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 17,
          fontWeight: FontWeight.w700),
    );
  }

  Widget _DrawSingleRow(Post post) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return SinglePost(post);

        }));
      },
      child: Padding(
        padding: EdgeInsets.all(0.1),
        child: Card(
          color: Colors.grey.shade200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                SizedBox(
                    height: 100,
                    width: 120,
                    child: Image.network(post.featuredImage)

                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        post.title,
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: <Widget>[
                          Text(' helo l'),
                          SizedBox(
                            width: 70,
                          ),
                          Row(
                            children: <Widget>[Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Icon(Icons.timer),
                            ),

                            Text(parseHumanDateTime(post.dateWritten),style: TextStyle(fontSize: 13),)],
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



  Widget _drawRecentcard(Color color,Post post) {
    return Card(
      child: GestureDetector(

        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return
            SinglePost(post);
          }));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(

                    image:NetworkImage(post.featuredImage),
                    fit: BoxFit.cover),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.27,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, left: 3),
              child: Container(
                padding: EdgeInsets.only(top: 3, bottom: 3, left: 24, right: 24),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'karrar',
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 4, top: 8, left: 4, bottom: 6),
              child: Text(
                'which gives you more contr',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 4, left: 4, right: 4),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.timer,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Flexible(
                    child: Text(
                      parseHumanDateTime(post.dateWritten),
                      style: TextStyle(fontSize: 13),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }




}
