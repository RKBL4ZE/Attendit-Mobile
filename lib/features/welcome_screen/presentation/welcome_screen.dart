import 'package:Attendit/config/constant.dart';
import 'package:Attendit/features/auth/presentation/widgets/login_form.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'delayed_animation.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final int delayedAmount = 500;

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.blueGrey[900],
          body: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Hero(
                    tag: welcomeScreenHero,
                    child: AvatarGlow(
                      endRadius: 90,
                      duration: Duration(seconds: 2),
                      glowColor: Colors.white24,
                      repeat: true,
                      repeatPauseDuration: Duration(seconds: 2),
                      startDelay: Duration(seconds: 1),
                      child: Material(
                          elevation: 8.0,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            child: Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: SvgPicture.asset(
                                'assets/images/logo.svg',
                                // height: 70,
                                // width: 70,
                              ),
                            ),
                            radius: 60.0,
                          )),
                    ),
                  ),
                ),
                DelayedAnimation(
                  child: Text(
                    "Hi There",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: color),
                  ),
                  delay: delayedAmount + 1000,
                ),
                DelayedAnimation(
                  child: Text(
                    "I'm AttendIt",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: color),
                  ),
                  delay: delayedAmount + 2000,
                ),
                SizedBox(
                  height: 30.0,
                ),
                DelayedAnimation(
                  child: Text(
                    "Your New Personal",
                    style: TextStyle(fontSize: 20.0, color: color),
                  ),
                  delay: delayedAmount + 3000,
                ),
                DelayedAnimation(
                  child: Text(
                    "companion",
                    style: TextStyle(fontSize: 20.0, color: color),
                  ),
                  delay: delayedAmount + 3000,
                ),
                FlatButton(
                  onPressed: () {
                    /* BlocProvider.of<AuthBloc>(context).add(InitialEvent()); */
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginForm()));
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 150, 0, 150),
                    height: 60,
                    width: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8185E2),
                        ),
                      ),
                    ),
                  ),
                ),
                /* DelayedAnimation(
                  child: GestureDetector(
                    onTapDown: _onTapDown,
                    onTapUp: _onTapUp,
                    child: Transform.scale(
                      scale: _scale,
                      child: _animatedButtonUI,
                    ),
                  ),
                  delay: delayedAmount + 4000,
                ), */
              ],
            ),
          )
          //  Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text('Tap on the Below Button',style: TextStyle(color: Colors.grey[400],fontSize: 20.0),),
          //     SizedBox(
          //       height: 20.0,
          //     ),
          //      Center(

          //   ),
          //   ],

          // ),
          ),
    );
  }
}
