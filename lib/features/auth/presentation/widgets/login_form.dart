import 'package:Attendit/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';

class LoginForm extends StatelessWidget {
  final password = TextEditingController();
  final username = TextEditingController();
  //static const routeName = '/LoginPage';
  @override
  Widget build(BuildContext context) {
    //  context.bloc<AuthBloc>().add(CheckSessionEvent());
    return BlocBuilder(
      bloc: BlocProvider.of<AuthBloc>(context),
      builder: (context, state) => Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(247, 247, 247, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Text("User ID"),

            Container(
              margin: new EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                //Add padding around textfield

                padding: EdgeInsets.symmetric(horizontal: 30.0),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text("User ID",
                          style: TextStyle(
                            fontSize: 18,
                            // fontFamily: 'Karla',
                            color: Color.fromRGBO(29, 53, 84, 1),
                          )

                          //style: Theme.of(context).textTheme.title,

                          ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withAlpha(70),
                              blurRadius: 6.0,
                              spreadRadius: 7.0,
                              offset: Offset(
                                0.0,
                                3.0,
                              ),
                            ),
                          ]),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        //  elevation: 5.0,
                        shadowColor: Color.fromRGBO(152, 214, 217, 1),
                        child: TextField(
                          controller: username,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.account_circle),

                            border: InputBorder.none,

                            //  contentPadding: EdgeInsets.all(8),

                            //Add th Hint text here.

                            hintText: "Enter UserID",

                            hintStyle: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(168, 181, 198, 1)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Container(
              margin: new EdgeInsets.symmetric(vertical: 10),
              child: Padding(
                //Add padding around textfield

                padding: EdgeInsets.symmetric(horizontal: 30.0),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: new EdgeInsets.fromLTRB(0, 0, 0, 10),
                        child: Text("Password",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Karla',
                              color: Color.fromRGBO(29, 53, 84, 1),
                            )

                            // style: Theme.of(context).textTheme.title,

                            )),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withAlpha(70),
                              blurRadius: 6.0,
                              spreadRadius: 7.0,
                              offset: Offset(
                                0.0,
                                3.0,
                              ),
                            ),
                          ]),
                      child: Material(
                        borderRadius: BorderRadius.circular(10.0),
                        // elevation: 10.0,
                        shadowColor: Color.fromRGBO(152, 214, 217, 1),
                        child: TextField(
                          controller: password,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.security),

                            border: InputBorder.none,

                            //contentPadding: EdgeInsets.all(8),

                            //Add th Hint text here.

                            hintText: "Enter Password",

                            hintStyle: TextStyle(
                                fontSize: 18.0,
                                color: Color.fromRGBO(168, 181, 198, 1)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: new EdgeInsets.fromLTRB(90, 30, 90,
                          30), //symmetric(horizontal:  110,vertical: 0),

                      child: Text("Forgot Password ?",
                          style: TextStyle(
                            color: Color.fromRGBO(168, 181, 198, 1),
                          )

                          // style: Theme.of(context).textTheme.title,

                          ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          print(password.toString());

                          print(username);

                          context.bloc<AuthBloc>().add(LoginEvent(
                              prefix: "msi",
                              userType: "student",
                              password: "Test12345",
                              username: "00414902019"));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(95, 197, 209, 1)
                                      .withAlpha(60),
                                  blurRadius: 9.0,
                                  spreadRadius: 7.0,
                                  offset: Offset(
                                    0.0,
                                    3.0,
                                  ),
                                ),
                              ],
                              gradient: Styles.colorGradientTheme,
                              borderRadius: BorderRadius.circular(10.0)),
                          constraints:
                              BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                          alignment: Alignment.center,
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
