import 'package:flutter/material.dart';
import 'package:untitled55/shared_ui/navigation_drawer.dart';
import 'home_taps/favorite.dart';
import 'home_taps/popular.dart';
import 'home_taps/whats_new.dart';
import 'package:untitled55/screens/pages/about.dart';
import 'package:untitled55/screens/pages/contact.dart';
import 'package:untitled55/screens/pages/help.dart';
import 'package:untitled55/screens/pages/settings.dart';


class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();




}

enum popoutmenu{ // to make pop menu
  HELP,CORECT,ABOUT,setting

}


class _HomeScreenState extends State<HomeScreen>with SingleTickerProviderStateMixin {
  TabController _tabController;




  @override

  void initState() {
    // TODO: implement setState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {// من الممكن ان يكون الكونترولير في الميموري ينتظر اكشن معين وانا انتقلت لشاشه جديده  لذلك هنا نتخلص  منه( بمعنى التخلص من المصدر بعد استخدامه )
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {




    return Scaffold(
      drawer: NavigationDrawer(),
appBar: AppBar(


  title: Text('Explore'),
  centerTitle: false,
  actions: <Widget>[
    IconButton(icon: Icon(Icons.search), onPressed: (){}),

    PopOutMenu(context),// to make pop menu


  ],
  bottom: TabBar(tabs:
  [
    Tab(text: "Waht 's new",),
    Tab(text: "favorite",),
    Tab(text: "popular",),
  ],
    indicatorColor: Colors.white70,
    controller: _tabController,
  ),
),
      body: Center(
        child: TabBarView(children: [
          WhatsNew(),
          Popular(),
          Favorite(),

        ],controller: _tabController,),



      ),


    );
  }

  PopOutMenu(BuildContext context) { // to make pop menu
    
    return 
        PopupMenuButton<popoutmenu>(itemBuilder: (contexts){

          return[
            PopupMenuItem(
              value: popoutmenu.ABOUT,

              child:Text('ABOUT-') ,
            ),
            PopupMenuItem(
              value: popoutmenu.CORECT,

              child:Text('CORECT-') ,
            ),
            PopupMenuItem(
              value: popoutmenu.HELP,

              child:Text('HELP-') ,
            ),
            PopupMenuItem(
              value: popoutmenu.HELP,

              child:Text('setting-') ,
            ),

          ];

        },onSelected: (popoutmenu k){
          //todo
          switch(k){
            case popoutmenu.HELP:
              Navigator.push(context, MaterialPageRoute(builder: (context){

                return Help();

              }));

              break;

            case popoutmenu.ABOUT:
              Navigator.push(context, MaterialPageRoute(builder: (context){

                return AboutUs();

              }));
              break;

            case popoutmenu.CORECT:
              Navigator.push(context, MaterialPageRoute(builder: (context){

                return Contact();

              }));
              break;
            case popoutmenu.setting:
              Navigator.push(context, MaterialPageRoute(builder: (context){

                return Setting();

              }));
              break;


          }



        },);
  }
}
