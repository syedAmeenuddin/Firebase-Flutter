import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teslearngap/mainpage6.dart';
import 'Kconstant.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController phoneNumberController = TextEditingController();
final TextEditingController otpController = TextEditingController();
final TextEditingController userNameController = TextEditingController();

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String userName;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        return Form(
          key: _formKey,
          child: Scaffold(
            body: ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 0,
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        alignment: Alignment.center,
                        child: Image(
                          color: Colors.yellow,
                          image: AssetImage('images/logo.jpg'),
                          height: 150,
                          width: 150,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  //here we go!
                  Container(
                    alignment: Alignment.center,
                    width: 300,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Email';
                        }
                        return null;
                      },
                      controller: emailController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your Email'),
                    ),
                  ), //email
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 300,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter username';
                        }
                        return null;
                      },
                      controller: userNameController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        userName = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your username'),
                    ),
                  ), //username
                  SizedBox(
                    height: 10.0,
                  ), //username
                  Container(
                    alignment: Alignment.center,
                    width: 300,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Password';
                        }
                        return null;
                      },
                      controller: passwordController,
                      textAlign: TextAlign.center,
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your Password'),
                    ),
                  ),
                  //here we end!

                  SizedBox(
                    height: 13,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: RoundButton(
                        text: 'Register',
                        colour: Colors.blue,
                        onPress: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          if (_formKey.currentState.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Registering Data')));
                          }
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);

                            if (newUser != null) {
                              final SharedPreferences sharedpreferences =
                                  await SharedPreferences.getInstance();
                              sharedpreferences.setString(
                                  'email', emailController.text);
                              sharedpreferences.setString(
                                  'username', userNameController.text);
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatPage(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
                            print(e);
                            setState(() {
                              showSpinner = false;
                            });
                          }
                        },
                      ),
                    ),
                  ), //login btn
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
