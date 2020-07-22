
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
        builder: (context, state) => Padding(
              padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
              child: Container(
                alignment: Alignment.bottomRight,
                height: 50,
                //width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue[200],
                      blurRadius: 5.0, // has the effect of softening the shadow
                      spreadRadius:
                          1.0, // has the effect of extending the shadow
                      /* offset: Offset(
                        5.0, // horizontal, move right 10
                        5.0, // vertical, move down 10
                      ), */
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: FlatButton(
                  onPressed: () {
                    context.bloc<AuthBloc>().add(LoginEvent(
                        userType: "student",
                        password: "Test1234!",
                        username: "00414902019"));
                    /* setState(() {}
					); */
                  },
                  child: setUpButtonChild(),
                ),
              ),
            ));
  }

  Widget setUpButtonChild() {
    if (widget.state is AuthWelcomeSuccess) {
      return new Text(
        "Login",
        style: TextStyle(
          color: Colors.lightBlueAccent,
          /* fontSize: 14,
          fontWeight: FontWeight.w700, */
        ),
      );
    } else if (widget.state is LoginLoading) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlueAccent),
        ),
      );
    } /* else if (widget.state is UserLogedIn) {
      BlocProvider.of<NavigatorBloc>(context).add(NavigateToHomeEvent());
      return Icon(Icons.check, color: Colors.lightBlueAccent);
    } */
    else if (widget.state is AuthError) {
      return Text("error");
    } else
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
