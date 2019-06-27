


import 'package:flutter/cupertino.dart';

class pageModel{

  String _images;
  String _title;
  String _description;
  IconData _icons;
  pageModel(this._description,this._icons,this._images,this._title);

  String get image => _images;
  String get titlem =>_title;

  String get descrp{
    return _description;
  }

  IconData get ico => _icons;
}