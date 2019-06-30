
import 'dart:math';

import 'package:untitled55/models/post.dart';
import 'package:flutter/material.dart';



class SinglePost extends StatefulWidget {


  final Post post;

  SinglePost(this.post);
  @override

  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {




  @override

  Widget build(BuildContext context) {
    return   Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
            //  title: Row(
             //   children: <Widget>[
               //   const Icon(Icons.menu,color: Colors.white,),
               //   const SizedBox(width: 10,),
                //  const Text('A.k'),

              //  ],

             // ),
              background:Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: ExactAssetImage('assets/images/pg2.jpg'),fit: BoxFit.cover),
                  gradient: LinearGradient(colors: [Colors.purpleAccent,Colors.red])
                ),
              ),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context,index){
            if(index==0){
              return _DrawPost();
            }else{
              return Container(
                height: 150,
                color: getRandomColor(),
              );

            }


          },childCount: 25))

        ],
      ),
    );
  }


  Color getRandomColor({int minBri = 50}){
    final random = Random();

    assert(minBri >= 0 && minBri <=255);
    return Color.fromARGB(0xFF,
        minBri + random.nextInt(255-minBri),
        minBri + random.nextInt(255-minBri),
        minBri + random.nextInt(255-minBri)
    );
  }
 Widget _DrawPost()  {

    return Container(
      child: Text( widget.post.content),
      height: 300,
      color: getRandomColor(),
    );
  }

}

