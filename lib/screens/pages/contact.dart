
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  TextEditingController usernamecontroler;
  TextEditingController emailcontroler;
  TextEditingController messagecontroler;
  final _formKey = GlobalKey<FormState>();
  bool isloding = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernamecontroler=TextEditingController();
    emailcontroler = TextEditingController();
    messagecontroler = TextEditingController();
  }
  @override
  void dispose(){
    super.dispose();
    usernamecontroler=TextEditingController();
        emailcontroler =TextEditingController();
        messagecontroler =TextEditingController();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('contact US'),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:(isloding)? _drawLoading():contactFom(),
        ),
      ),
    );
  }

  Widget contactFom(){
   return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: usernamecontroler,
            decoration: InputDecoration(
                labelText: 'Your name '
            ),
            validator: (v){
              if(v.isEmpty){
                return'please enter your name';
              }else{
                return null;
              }
            },
          ),
          TextFormField(
            controller: emailcontroler,
            decoration: InputDecoration(
                labelText: 'Your email '
            ),
            validator: (v){
              if(v.isEmpty){
                return'please enter your email';
              }else{
                return null;
              }
            },
          ),
          TextFormField(
            controller: messagecontroler,
            decoration: InputDecoration(
                labelText: 'message'
            ),
            maxLines: 4,
            validator: (v){
              if(v.isEmpty){
                return'please enter your message';
              }else{
                return null;
              }
            },
          ),
          SizedBox(width: double.infinity,child: RaisedButton(onPressed: (){
            if(_formKey.currentState.validate()){

              String name = usernamecontroler.text;
              String email = emailcontroler.text;
              String message = messagecontroler.text;
              setState(() {
                isloding=true;
              });

            }else{

              setState(() {
                isloding=false;
              });
            }
          },child: Text('send',style: TextStyle(color: Colors.white),),),)
        ],
      ),
    );

  }
  Widget _drawLoading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
