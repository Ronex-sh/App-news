
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart';

Widget conectionerror(){
  return
    Padding(
      padding: const EdgeInsets.all(13),
      child: Container(

        child:
        Text('connection error!!!'),
      ),
    );
}

Widget  error (var error){
  return
    Container(

      child:
      Padding(
        padding: const EdgeInsets.all(15),
        child: Text(error.toString()),
      ),
    );


}
Widget nodata() {

  return
    Padding(
      padding: const EdgeInsets.all(16),
      child: Container(

        child:
        Text('no data avilable'),
      ),
    );
}

Widget loading() {

  return Padding(
    padding: const EdgeInsets.only(top: 13,bottom: 13),
    child: Container(
      child:
      Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );
}

String parseHumanDateTime(String dataTime){

  Duration timeAgo = DateTime.now().difference(DateTime.parse(dataTime));
  DateTime theDifference = DateTime.now().subtract(timeAgo);

  return format(theDifference);
}