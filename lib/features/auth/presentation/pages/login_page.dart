import 'package:Attendit/config/styles.dart';
import 'package:Attendit/core/navigator/bloc/navigator_bloc.dart';
import 'package:Attendit/features/auth/presentation/widgets/login_form.dart';
import 'package:Attendit/features/welcome_screen/presentation/welcome_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/LoginPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: GradientAppBar(
      //   title: Container(
      //       alignment: Alignment.center,

      //       // margin: new EdgeInsets.fromLTRB(0, 38, 0, 0),
      //       child: Text("Attend IT")),
      //   gradient: Styles.colorGradientTheme,
      // ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UserLogedIn) {
            BlocProvider.of<NavigatorBloc>(context).add(NavigateToHomeEvent());
          }
          if (state is AuthError) {
            final snackBar = SnackBar(
              content: Text(state.message),
              action: SnackBarAction(
                label: 'Ok',
                onPressed: () {
                  // Some code to undo the change.
                },
              ),
            );

            // Find the Scaffold in the widget tree and use
            // it to show a SnackBar.
            Scaffold.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is AuthWelcome)
            return WelcomeScreen();
          else if (state is UserLogedIn) {
            return loaderWidget; //for short loading during loged in
          } else
            return LoginForm(state: state);
        }),
      ),
    );
  }
}
