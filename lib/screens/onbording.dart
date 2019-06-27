import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled55/pagemodwl.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

import 'home_screen.dart';

class onBoarding extends StatefulWidget {
  @override
  _onBoardingState createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  List<pageModel> pages ;
  ValueNotifier<int> _pageviewNotifiew = ValueNotifier(0);

  void addpages() {
    pages =  List<pageModel>();
    pages.add(pageModel(
        'Hendrerit purus curabitur vitae odio per consequat condimentum, nunc per est nam turpis duis egestas etiam, quisque porta viverra sagittis adipiscing velit.',
        Icons.camera,
        'assets/images/bg.jpg',
        'welcome'));
    pages.add(pageModel(
        'Netus sagittis consectetur inceptos consectetur vulputate ante consequat per, urna ut felis sem viverra rhoncus id molestie ac, sollicitudin tortor sapien .',
        Icons.brightness_high,
        'assets/images/pg2.jpg',
        'Map'));
    pages.add(pageModel(
        'Consequat netus id amet volutpat ipsum class, scelerisque nulla phasellus magna augue, felis sit donec inceptos lacus et ornare varius etiam.',
        Icons.ac_unit,
        'assets/images/pg3.jpg',
        'about'));
    pages.add(pageModel(
        'Posuere odio quisque cursus at mi est sodales placerat, sed imperdiet fusce sed cras phasellus lacinia nullam malesuada, bibendum ante imperdiet sagittis non gravida.',
        Icons.dashboard,
        'assets/images/pg4.jpg',
        'thanks'));
  }

/*
  List<String> images = [
    'assets/images/bg.jpg',
    'assets/images/pg2.jpg',
    'assets/images/pg3.jpg',
    'assets/images/pg4.jpg'
  ];
  List<IconData> icons = [
    Icons.camera,
    Icons.brightness_high,
    Icons.ac_unit,
    Icons.dashboard,
  ];
  List<String> title = [
    'welcome',
    'Map',
    'about',
    'thanks ',
  ];
  List<String> description = [
    'Hendrerit purus curabitur vitae odio per consequat condimentum, nunc per est nam turpis duis egestas etiam, quisque porta viverra sagittis adipiscing velit.',
    'Netus sagittis consectetur inceptos consectetur vulputate ante consequat per, urna ut felis sem viverra rhoncus id molestie ac, sollicitudin tortor sapien ',
    'Consequat netus id amet volutpat ipsum class, scelerisque nulla phasellus magna augue, felis sit donec inceptos lacus et ornare varius etiam.',
    'Posuere odio quisque cursus at mi est sodales placerat, sed imperdiet fusce sed cras phasellus lacinia nullam malesuada, bibendum ante imperdiet sagittis non gravida ',
  ];
  */


  @override
  Widget build(BuildContext context) {
    addpages();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemBuilder: (BuildContext context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: ExactAssetImage(pages[index].image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        child: Icon(
                          pages[index].ico,
                          size: 150,
                          color: Colors.white,
                        ),
                        offset: Offset(0, -110),
                      ),
                      Text(
                        pages[index].titlem,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Text(
                          pages[index].descrp,
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: pages.length,
            onPageChanged: (i){
              _pageviewNotifiew.value=i;
            }

          ),
          Transform.translate(
            offset: Offset(0, -30),
            child: Align(
              alignment: Alignment.center,
              child: _displaypageindicators(pages.length)
                



                //  mainAxisAlignment: MainAxisAlignment.center,
                // children:
                //    _drawpageIndicators(),


              
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.red.shade800,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        _updateseen();
                        return HomeScreen();
                      }));
                    },

                    child: Text(
                      'get started ',
                      style: TextStyle(
                          color: Colors.white, fontSize: 16, letterSpacing: 1),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget _displaypageindicators(int length){
    return PageViewIndicator(
      pageIndexNotifier: _pageviewNotifiew,//مهمتها مراقبه القيمه(الصفحات) التي اذا تغيرت تبعث تنبيه الى قيمه اخرى(PageViewIndicator) معتمده على القيمه الاولى(يخلي عينه ع القيمه كلما تتغير يقوم بعمل معين)
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.white,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }
  /*
  List<Widget> _drawpageIndicators(){
    List<Widget>_widgets = List<Widget>();
    for(var i in pages){
      _widgets.add(_drawCircle(Colors.red));

    }return _widgets;

  }
  Widget _drawCircle(Color color){
    return Container(

      width: 13,
      margin: EdgeInsets.only(left: 7.5,),
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: color),

    );
  }
}
*/
  void _updateseen() async{
    SharedPreferences perse = await SharedPreferences.getInstance();
    perse.setBool('seen',true);

  }
}
