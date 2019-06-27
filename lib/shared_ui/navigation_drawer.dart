import 'package:flutter/material.dart';
import 'package:untitled55/models/nav_menu.dart';
import 'package:untitled55/screens/home_screen.dart';
import 'package:untitled55/screens/headline_news.dart';
import 'package:untitled55/screens/twitter_feed.dart';
import 'package:untitled55/screens/instgram_feed.dart';
import 'package:untitled55/screens/facebook_feed.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<NavMenuItem>navigationMenu = [
    NavMenuItem('Explore', ()=>HomeScreen()),// هنا لو تم استخدام غير الفكشن لكان كل مره نفتح البرنامج يقوم بانشاء الهوم سكرين والهادلاين نيوز لكن بوجود الفكشن يتم انشائهم فقط عندما يتم استدعائهم عن طريق الاون تاب(ضغط الزر)
    NavMenuItem('HeadLine News', ()=>HeadLineNews()),
    NavMenuItem('TwitterFeed', ()=>TwitterFeed()),
    NavMenuItem('Instagram Feed', ()=>InstagramFeed()),
    NavMenuItem('Facebook Feed', ()=>FaceBookFeed())

  ];
  List navMenu=[

    'A','B','C','D','E'
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 70,left: 30),
        child: ListView.builder(
          itemBuilder: (context ,h){
            return ListTile(
              title: Text(navigationMenu[h].title,style: TextStyle(color: Colors.grey.shade700,fontSize: 22),),
              trailing:  Icon(Icons.chevron_right,color:Colors.grey.shade400 ,),
              onTap: (){
                Navigator.pop(context);// اضفنا هذا لان هذا لايسمح بالسهم اليذي يوجد عند كل صفحه بالرجوع الى الدراوير لكن يرجع لصفحه اخرى بدون ان يرجع للدراوير(احذفه وجرب الفرق .. اي نقول  لدراور اغلق نفسك وانتقل للصفحه الجديده)
                Navigator.push(context,MaterialPageRoute(builder:  (BuildContext context){// المتريل بيج رواتر يحتوي على خاصيه انه يحتفظ بقيمة الصفحه المراد الذهاب اليها كذلك يعطي لهذه الصفحه الامكانيه ان ترجع للدراوير عن طريق سهم الرجوع الخاص بها
                  return navigationMenu[h].destination();


                }) );
              },
            );

          },itemCount: navigationMenu.length,

        ),
      ),
    );
  }
}
