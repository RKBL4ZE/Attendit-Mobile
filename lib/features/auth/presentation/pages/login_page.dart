import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/LoginPage';
  @override
  Widget build(BuildContext context) {
    final password = TextEditingController();
    final username = TextEditingController();
    // final prop = Dummy_AllPropertys.toList();

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => Scaffold(
        appBar: GradientAppBar(
          title: Container(
              alignment: Alignment.center,

              // margin: new EdgeInsets.fromLTRB(0, 38, 0, 0),
              child: Text("Attend IT")),
          gradient: LinearGradient(colors: [
            Color.fromRGBO(95, 197, 209, 1),
            Color.fromRGBO(152, 214, 217, 1)
          ]),
        ),
        body: Center(
            child: Container(
          decoration: BoxDecoration(),
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
                              fontFamily: 'Karla',
                              color: Color.fromRGBO(29, 53, 84, 1),
                            )
                            //style: Theme.of(context).textTheme.title,
                            ),
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(15.0),
                        elevation: 10.0,
                        shadowColor: Colors.blueGrey,
                        child: TextField(
                          controller: username,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),

                            //Add th Hint text here.
                            hintText: "08914902017",
                            hintStyle: TextStyle(
                                fontSize: 15.0,
                                color: Color.fromRGBO(168, 181, 198, 1)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
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
                      Material(
                        borderRadius: BorderRadius.circular(15.0),
                        elevation: 10.0,
                        shadowColor: Colors.blueGrey,
                        child: TextField(
                          controller: password,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            //Add th Hint text here.
                            hintText: "PasS123",
                            hintStyle: TextStyle(
                                fontSize: 15.0,
                                color: Color.fromRGBO(168, 181, 198, 1)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
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
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            print(password.toString());
                            print(username);

                            context.bloc<AuthBloc>().add(LoginEvent(
                                prefix: "msi",
                                userType: "student",
                                password: password.toString(),
                                username: username.toString()));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(95, 197, 209, 1),
                                    Color.fromRGBO(152, 214, 217, 1)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 300.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
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
        )),
      ),
    );
  }
}
