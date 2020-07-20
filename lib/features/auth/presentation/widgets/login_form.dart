import 'package:Attendit/config/styles.dart';
import 'package:Attendit/features/auth/presentation/Animation/FadeAnimation.dart';
import 'package:Attendit/features/auth/presentation/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

class LoginForm extends StatelessWidget {
  final AuthState state;
  final password = TextEditingController();
  final username = TextEditingController();

  LoginForm({Key key, this.state}) : super(key: key);
  //static const routeName = '/LoginPage';
  @override
  Widget build(BuildContext context) {
    //  context.bloc<AuthBloc>().add(CheckSessionEvent());
    return Scaffold(
      
      body: BlocBuilder(
          bloc: BlocProvider.of<AuthBloc>(context),
          builder: (context, state) => SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 400,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/background.png'),
                                fit: BoxFit.fill)),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 30,
                              width: 80,
                              height: 200,
                              child: FadeAnimation(
                                  1,
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/light-1.png'))),
                                  )),
                            ),
                            Positioned(
                              left: 140,
                              width: 80,
                              height: 150,
                              child: FadeAnimation(
                                  1.3,
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/light-2.png'))),
                                  )),
                            ),
                            Positioned(
                              right: 40,
                              top: 40,
                              width: 80,
                              height: 150,
                              child: FadeAnimation(
                                  1.5,
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/clock.png'))),
                                  )),
                            ),
                            Positioned(
                              child: FadeAnimation(
                                  1.6,
                                  Container(
                                    margin: EdgeInsets.only(top: 50),
                                    child: Center(
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Column(
                          children: <Widget>[
                            FadeAnimation(
                                1.8,
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Styles.colorshadow
                                                .withAlpha(100),
                                            blurRadius: 9.0,
                                            spreadRadius: 1.0,
                                            offset: Offset(0, 0))
                                      ]),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors.grey[100]))),
                                        child: TextField(
                                          controller: username,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              // prefix: Icon(Icons.person),
                                              hintText: "Enrollment Number",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400])),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: password,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              //prefix: Icon(Icons.lock),
                                              hintText: "Password",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey[400])),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: 30,
                            ),
                            FadeAnimation(
                                2,
                                LoginButton(
                                  state: state,
                                )),
                            SizedBox(
                              height: 70,
                            ),
                            FadeAnimation(
                                1.5,
                                Text(
                                  "Forgot Password?",
                                  style: TextStyle(color: Styles.colorshadow),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
    );
  }
}
