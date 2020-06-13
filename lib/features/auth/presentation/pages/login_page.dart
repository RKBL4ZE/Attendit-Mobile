import 'package:Attendit/core/injection/injection.dart';
import 'package:Attendit/core/navigator/bloc/navigator_bloc.dart';
import 'package:Attendit/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/LoginPage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => getIt(),
      child: Scaffold(
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
        body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is AuthInitial) {
            return LoginForm();
          }
          if (state is LoginLoading) {
            return Center(child: Text("Lodaing"));
          }
          if (state is UserLogedIn) {
            BlocProvider.of<NavigatorBloc>(context).add(NavigateToHomeEvent());
            return Center(child: Text("Logged IN"));

          }
          if (state is AuthError) {
            return Text(state.message);
          }
        }),
      ),
    );
  }
}
