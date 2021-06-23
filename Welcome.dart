import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'mainpage3.dart';
import 'mainpage5.dart';
var speed = Duration(seconds: 7);

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Color(0xFFFFFFF471),
        //backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'WELCOME',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image(
                      color: Colors.yellow,
                      image: AssetImage('images/logo.jpg'),
                      height: 80,
                      width: 80,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
// ignore: deprecated_member_use
                  child: TypewriterAnimatedTextKit(
                    duration: speed,
                    text: ['Baatacheet'],
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      fontSize: 40,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'LOGIN',
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LoginOptionButton(
              text: ' Email',
              onPress: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(seconds: 1),
                    pageBuilder: (_, __, ___) => LoginPage(),
                  ),
                );
              },
              colour: Colors.yellow,
            ),
            SizedBox(
              height: 10,
            ),
            LoginOptionButton(
              text: 'Phone Number',
              onPress: () {
                print('Phone Number');
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(seconds: 1),
                    pageBuilder: (_, __, ___) => RegisterPhonePage(),
                  ),
                );
              },
              colour: Colors.yellow,
            ),
            SizedBox(
              height: 10,
            ),
            LoginOptionButton(
              text: ' Google',
              onPress: () {
                print('Not launched!. we will proceed soon :)');
              },
              colour: Colors.yellow,
            ),
          ],
        ),
      );

  }

}

class LoginOptionButton extends StatelessWidget {
  LoginOptionButton(
      {@required this.colour, @required this.onPress, @required this.text});
  final colour;
  final onPress;
  final text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(20.0),
        elevation: 5.0,
        child: MaterialButton(
            onPressed: onPress,
            //minWidth: 100,
            height: 40.0,
            child: SizedBox(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      letterSpacing: 1.0,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    child: Icon(
                      Icons.login,
                      color: colour,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
