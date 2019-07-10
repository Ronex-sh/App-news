
import 'package:flutter/material.dart';
import 'package:untitled55/shared_ui/navigation_drawer.dart';


class FaceBookFeed extends StatefulWidget {
  @override
  _FaceBookFeedState createState() => _FaceBookFeedState();
}

class _FaceBookFeedState extends State<FaceBookFeed> {
  List<int> id;



  TextStyle _HashtagStyle = TextStyle(
      color: Colors.orange
  );
  @override
  void initState(){
    super.initState();
    id=[1,2,3];

  }
  @override

  Widget build(BuildContext context) {
    return

      Scaffold(

        appBar: AppBar(
          title: Text('Faccebook Feed'),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  _drawHeader(k),
                  _drawTitle(),

                  _drawHashTags(),
                  _drawBody(),
                  _drawFooter()


                ],
              ),
            );
          },
          itemCount: 10,

        ),
        drawer: NavigationDrawer(),// في حالة اردنا يظهر دراوير بدلا من سهم الرجوع
      );

  }




  Widget _drawHeader(k) {


    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: <Widget>[


        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: CircleAvatar(backgroundImage: AssetImage('assets/images/pg2.jpg'),radius: 20,),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(' kat gdgcggss',style: TextStyle(fontWeight: FontWeight.w700)),
                    SizedBox(width: 6,),

                  ],
                ),
                SizedBox(height: 8,),
                Text(' fgfvvb ‏ 34 /05‏/2019',style: TextStyle(color: Colors.grey))
              ],
            )
          ],

        ),
        Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.favorite,color:(id.contains(k))?Colors.red :Colors.grey.shade300,),
                onPressed: (){
              setState(() {
                if(id.contains(k)){
                  id.remove(k);

                }else{

                  id.add(k);
                }

              });



                }),
            Transform.translate(
                offset: Offset(-10, 0),


                child: Text('24',style: TextStyle(color: Colors.grey,fontSize: 16),)),

          ],
        )
      ],
    );


  }

  Widget _drawTitle() {
    return

      Padding(
        padding: const EdgeInsets.only(bottom: 8,left: 13),
        child: Text(' mService.startInputOrWindowGainedFocus',style: TextStyle(color: Colors.grey.shade800),),
      );
  }



  Widget _drawHashTags() {
    return Container(
      child: Wrap(

        children: <Widget>[
          FlatButton(onPressed: (){}, child: Text('#advance',style: _HashtagStyle,)),
          FlatButton(onPressed: (){}, child: Text('#advance',style: _HashtagStyle,)),
          FlatButton(onPressed: (){}, child: Text('#advance',style: _HashtagStyle,)),
        ],
      ),
    );
  }

  Widget _drawBody() {
    return
      SizedBox( //متوافق مع حجم اي صوره تاتي من اي بي اي
          width: double.infinity,
          height: MediaQuery.of(context).size.height/3,
          child: Image.asset('assets/images/pg2.jpg',fit: BoxFit.cover,));
  }

  Widget _drawFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        FlatButton(onPressed: (){}, child: Text('10 OMMENTS',style: _HashtagStyle,)),
        Row(
          children: <Widget>[
            FlatButton
              (onPressed: (){}, child: Text('SHARE',style: _HashtagStyle,)),
            FlatButton
              (onPressed: (){}, child: Text('OPEN',style: _HashtagStyle,)),
          ],
        ),
      ],
    );
  }
}
