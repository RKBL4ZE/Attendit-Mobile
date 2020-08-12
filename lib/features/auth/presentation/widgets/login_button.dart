import 'package:Attendit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  final AuthState state;
  // final String password;
  // final String username;

  // final Function() onPressed;

  const LoginButton({
    @required this.state,
    this.usernameController,
    this.passwordController,
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
    Size size = MediaQuery.of(context).size;
    return BlocBuilder(
        cubit: BlocProvider.of<AuthBloc>(context),
        builder: (context, state) => Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  color: Colors.purple[700],
                  onPressed: () {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    if (widget.usernameController.text.length < 11 ||
                        widget.passwordController.text.length < 8) {
                      context
                          .bloc<AuthBloc>()
                          .add(ErrorEvent('Please enter valid credentials'));
                    } else {
                      context.bloc<AuthBloc>().add(LoginEvent(
                          userType: "student",
                          password: widget.passwordController.text,
                          username: widget.usernameController.text));
                    }
                  },
                  child: Center(child: setUpButtonChild()),
                ),
              ),
            ));
  }

  Widget setUpButtonChild() {
    if (widget.state is AuthWelcomeSuccess ||
        widget.state is AuthInitial ||
        widget.state is AuthError ||
        widget.state is UserLoggedOut) {
      return new Text(
        "Login",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          //fontWeight: FontWeight.w700,
        ),
      );
    } else if (widget.state is LoginLoading) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else if (widget.state is UserLogedIn) {
      //BlocProvider.of<NavigatorBloc>(context).add(NavigateToHomeEvent());
      return Icon(Icons.check, color: Colors.lightBlueAccent);
    }
    // else if (widget.state is AuthError) {
    //   return Text("error");
    // }
    else
      return Container();
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
