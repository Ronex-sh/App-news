
import 'package:flutter/material.dart';
import 'package:untitled55/shared_ui/navigation_drawer.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Twitter Feed'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){})
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(left: 12,right: 12),

          
          itemBuilder: (context , k){
       

        return Card(
          margin: EdgeInsets.only(bottom: 1),

          child: Column(
            children: <Widget>[
              _cardHeader(),
              _cardBody(),
              _DrawLine(),
              _cardFooter(),
            ],
          ),
        );
      },itemCount: 10,),
      //drawer: NavigationDrawer(),// في حالة اردنا يظهر دراوير بدلا من سهم الرجوع
    );
  }
}


Widget _cardHeader(){
  return Row(

    children: <Widget>[

      Padding(
        padding: const EdgeInsets.all(16),
        child: CircleAvatar(backgroundImage: AssetImage('assets/images/pg2.jpg'),radius: 25,),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(' kat gdgcggss',style: TextStyle(fontWeight: FontWeight.w700)),
              SizedBox(width: 6,),
              Text('kdmdkvkdkskl',style: TextStyle(color: Colors.grey,),)
            ],
          ),
          SizedBox(height: 8,),
          Text(' fgfvvb ‏ 34 /05‏/2019',style: TextStyle(color: Colors.grey))
        ],
      )
    ],
  );

}

Widget _cardBody(){
  return Padding(
    padding: const EdgeInsets.only(left: 14,right: 16,bottom: 6),
    child: Container(
      child:
      Text('Arrived totally in as between private. Favour of so as on pretty though elinor direct.',style: TextStyle(fontSize: 16,height: 1.2),),
    ),
  );

}

Widget _DrawLine(){
  return Container(
    height: 1,
    color: Colors.grey.shade200,
    margin: EdgeInsets.only(top: 18),
  );

}

Widget _cardFooter(){
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(icon:Icon(Icons.repeat,size: 19,), onPressed: (){},color: Colors.deepOrange,),Text('25',style: TextStyle(color: Colors.grey,)),
          ],
        ),
        Row(
          children: <Widget>[
            FlatButton(onPressed: (){}, child: Text('SHARE',style: TextStyle(color: Colors.deepOrange),)),
            FlatButton(onPressed: (){}, child: Text('OPEN',style: TextStyle(color: Colors.deepOrange))),

          ],
        )
      ],
    ),
  );

}
