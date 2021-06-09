import 'package:flutter/material.dart';
import 'Homepage.dart';

class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> _key = new GlobalKey();
 
     bool _isObscure = true;
  bool _autovalidate = false;
  String name, email, mobile, collegename;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Signup"),
      ),
      body: SingleChildScrollView(
              child: Form(
          key: _key,
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0)),
                  Image(
                    image: AssetImage("images/logo.png"),
                    width: 100.0,
                    height: 100.0,
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Enter Name';
                        }
                      },
                      decoration: InputDecoration(labelText: 'Name'),
                      onSaved: (input) => name = input,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Enter Email';
                        }
                      },
                      decoration: InputDecoration(labelText: 'Email'),
                      onSaved: (input) => email = input,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.school),
                    title: TextFormField(
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Enter College Name';
                        }
                      },
                      decoration: InputDecoration(labelText: 'Collegename'),
                      onSaved: (input) => collegename = input,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: TextFormField(
                      obscureText: _isObscure,
                      
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Mobile number';
                        }
                      
                      },
                      decoration: InputDecoration(labelText: 'Mobilenumber',
                      suffixIcon: IconButton(icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                       onPressed: (){
                         setState(() {
                           _isObscure = !_isObscure;
                         });
                       }
                      )
                      ),
                      onSaved: (input) => mobile = input,
                    ),
                  ),
                   Padding(padding: EdgeInsets.all(10.0)),
                  ButtonTheme(
                    height: 40.0,
                    minWidth: 200.0,
                    child: RaisedButton(
                      onPressed: _sendtoNextscreen,
                      color: Colors.greenAccent,
                      child: Text(
                        "save",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                   Padding(padding: EdgeInsets.all(20.0))
                ],
              )),
        ),
      ),
    );
  }

  _sendtoNextscreen() {
    if (_key.currentState.validate()) {
      //saves globel key
      _key.currentState.save();
      //send to next screen
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Homepage(
                  name: name,
                  email: email,
                  mobile: mobile,
                  collegename: collegename,
                  )));
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }
}
