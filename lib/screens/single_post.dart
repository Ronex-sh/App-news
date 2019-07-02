
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
                  image: DecorationImage(image: NetworkImage(widget.post.featuredImage),fit: BoxFit.fill),
                  gradient: LinearGradient(colors: [Colors.purpleAccent,Colors.red])
                ),
              ),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate((context,index){
            if(index==0){
              return _DrawPost();
            }

            else if(index >=1 && index <24) {
              return _comments();

            }else if (index==24){
              return _commentText();
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

    return
      Container(
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Text( widget.post.content,style: TextStyle(fontSize: 20,letterSpacing: 1,height: 1.2),),
      ),
      height: 300,
      color:  Colors.white    //getRandomColor(),
    );
  }

  Widget _comments() {

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[

             CircleAvatar(
               backgroundImage: NetworkImage(widget.post.featuredImage),
             ),
              SizedBox(
              width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('karrar '),
                  Text('1 hour'),
                ],
              )
            ],

          ),
          SizedBox(height: 12,),
          Text('tarting input: tba=android.view.inputmethod.EditorInfo@f1a8408 nm : com.example.unt')
        ],
      ),
    );

  }

  Widget _commentText() {
    return Container(
      color: Color.fromRGBO(233, 231, 233, 1),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
   Flexible(
               child:   Padding(
                 padding: const EdgeInsets.only(bottom: 16,left: 12),
                 child: TextField(

          decoration: InputDecoration(

            border:InputBorder.none,



            hintText: 'plese enter a search term',
            fillColor: Color.fromRGBO(233, 231, 233, 1),
            filled: true,





          ),



  ),
               ),
),FlatButton(onPressed: (){}, child: Text('send',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.purple,)))
            ],
          ),

        ],

      ),
    );
  }

}

