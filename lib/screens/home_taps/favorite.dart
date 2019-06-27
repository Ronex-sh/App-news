import 'dart:math';

import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {

  List colotlist=[
    Colors.deepOrange,
    Colors.indigo,
    Colors.amber,
    Colors.purpleAccent,
    Colors.lightGreen
  ];
Random random = Random();


  Color getRandomColor(){
return colotlist[random.nextInt(colotlist.length)];

  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, f) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[_authorRow(),SizedBox(height: 8,), _newsItemRow()],
            ),
          ),
        );
      },
      itemCount: 10,
    );
  }

  Widget _authorRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/pg2.jpg'),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle),
                width: 60,
                height: 60,
                margin: EdgeInsets.all(13),

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Michael Adams',style: TextStyle(color: Colors.grey),),
                  SizedBox(height: 9),
                  Row(
                    children: <Widget>[
                      Text('15 Min .',style: TextStyle(color: Colors.grey)),

                      Text('Life Style',style: TextStyle(color: getRandomColor()),),
                    ],
                  )
                ],
              )
            ],
          ),
          IconButton(icon: Icon(Icons.bookmark_border), onPressed: (){},color: Colors.grey,)
        ],

    );
  }

  Widget _newsItemRow() {
    return Row(

      children: <Widget>[

        Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(image: DecorationImage(

              image: ExactAssetImage('assets/images/pg2.jpg'),
              fit: BoxFit.fill),),

          width: 120,height: 120,

        ),


        Expanded(
          child: Column(

            children: <Widget>[


              Padding(
                padding: const EdgeInsets.only(right: 34),
                child: Text('google translate android',style: TextStyle(fontSize: 20,fontWeight:FontWeight.w600,),),
              ),
              Text('google translate androidgoogle translate androidgoogle translate androidgoogle translate android',style: TextStyle(color: Colors.grey,height: 1.5),),
            ],
          ),
        )
      ],
    );
  }
}
