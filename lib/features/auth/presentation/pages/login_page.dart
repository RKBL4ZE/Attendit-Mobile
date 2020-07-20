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
    BlocProvider.of<AuthBloc>(context).add(CheckSessionEvent());
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
            BuildContext dialogContext;
            showDialog(
                context: context,
                builder: (context) {
                  dialogContext = context;
                  return CupertinoAlertDialog(
                    title: new Text("Alert"),
                    content: new Text("You have been logged out."),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.pop(dialogContext);
                        },
                      )
                    ],
                  );
                });
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is AuthError ||
              state is AuthInitial ||
              state is LoginLoading ||
              state is AuthWelcomeSuccess) return LoginForm(state: state);
          if (state is AuthWelcome) return WelcomeScreen();
          return Container();
        }),
      ),
    );
  }
}
