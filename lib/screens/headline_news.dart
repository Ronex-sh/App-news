
import 'package:flutter/material.dart';
import 'package:untitled55/shared_ui/navigation_drawer.dart';

import 'home_taps/favorite.dart';
import 'home_taps/popular.dart';
import 'home_taps/whats_new.dart';

class HeadLineNews extends StatefulWidget {
  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews>with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(


        title: Text('HeadLine News'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){})
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
          Favorite(),
         Popular(),
          Favorite(),

        ],controller: _tabController,),



      ),


    );

  }
}
