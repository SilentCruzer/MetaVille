import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';

class Login extends StatefulWidget {
  var photos = ['images/building.png','images/family.png'];

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode focusEmail = new FocusNode();
  FocusNode focusPass = new FocusNode();

  var _timer;
  int _pos=0;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 7), (Timer t) {
      setState(() {
        _pos = (_pos + 1) % widget.photos.length;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return GestureDetector(
      onTap: (){FocusManager.instance.primaryFocus?.unfocus(); setState(() {
      });},
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.all(45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    widthFactor: 0.85,
                    child: Container(
                      child: Stack(children: [AnimatedOpacity(opacity: _pos==1?1:0,
                          duration: Duration(milliseconds: 1000),
                          child: Image.asset(widget.photos[1])),
                        AnimatedOpacity(opacity: _pos==0?1:0,
                            duration: Duration(milliseconds: 1000),
                            child: Image.asset(widget.photos[0]))
                      ]),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextField(
                      onTap: (){setState(() {
                      });},
                      focusNode: focusEmail,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            )
                        ),
                        prefixIcon: Icon(
                          Icons.alternate_email,
                          color: focusEmail.hasFocus ? Theme.of(context).primaryColor : Colors.grey.shade400,
                        ),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextField(
                      onTap: (){setState(() {
                      });},
                      focusNode: focusPass,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            )
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: focusPass.hasFocus ? Theme.of(context).primaryColor : Colors.grey.shade400,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.help,
                            color: Theme.of(context).primaryColor,
                          ), onPressed: () {  },
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );},
                      child: Text('Login'),
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all(Color(0xff0165ff)),
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              )
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text('Or, login with...',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset('images/google.png'),
                        iconSize: 50,
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: Image.asset('images/fb.png'),
                        iconSize: 50,
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        icon: Image.asset('images/twitter.png'),
                        iconSize: 50,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ Text('New to MetaVille? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.normal,
                      ),
                    ), Text('Register',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff0165ff),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ],
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
