import 'package:Attendit/config/styles.dart';
import 'package:Attendit/core/navigator/bloc/navigator_bloc.dart';
import 'package:Attendit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatefulWidget {
  final AuthState state;
 // final String password;
 // final String username;

  // final Function() onPressed;

  const LoginButton({
    @required this.state,
    //@required this.password,
   // @required this.username,
    // @required this.onPressed,
  });

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: BlocProvider.of<AuthBloc>(context),
        builder: (context, state) => Container(
              alignment: Alignment.center,
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  context.bloc<AuthBloc>().add(LoginEvent(
                      userType: "student",
                      password: "Test1234!",
                      username: "00414902019"));
                  setState(() {});
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                padding: EdgeInsets.all(0.0),
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Styles.colorshadow,
                          blurRadius: 9.0,
                          spreadRadius: 1.0,
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                        ),
                      ],
                      gradient: Styles.colorGradientTheme,
                      borderRadius: BorderRadius.circular(10.0)),
                  constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                  alignment: Alignment.center,
                  child: setUpButtonChild(),
                ),
              ),
            ));
  }

  Widget setUpButtonChild() {
    if (widget.state is AuthInitial) {
      return new Text(
        "Login",
        style: TextStyle(
            fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
      );
    } else if (widget.state is LoginLoading) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else if (widget.state is UserLogedIn) {
      BlocProvider.of<NavigatorBloc>(context).add(NavigateToHomeEvent());
      return Icon(Icons.check, color: Colors.white);
    } else if (widget.state is AuthError) {
      return Icon(
        Icons.clear,
        color: Colors.white,
      );
    }
  }

//   void animateButton() {
//     setState(() {
//       widget.state = 1;
//     });

//     Timer(Duration(milliseconds: 3300), () {
//       setState(() {
//         widget.state = 2;
//       });
//     });
//   }
// }
}
