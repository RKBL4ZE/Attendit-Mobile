import 'package:Attendit/config/constant.dart';
import 'package:Attendit/features/auth/presentation/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import 'sub_widgets/input_password.dart';
import 'sub_widgets/input_username.dart';
import 'sub_widgets/textLogin.dart';
import 'sub_widgets/verticalText.dart';

class LoginForm extends StatelessWidget {
  final AuthState state;
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  LoginForm({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
          bloc: BlocProvider.of<AuthBloc>(context),
          builder: (context, state) => Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.blueGrey[800], Colors.blueGrey[900]]),
                ),
                child: Column(
                  children: <Widget>[
                    Row(children: <Widget>[
                      VerticalText(),
                      TextLogin(),
                    ]),
                    Inputusername(usernameController),
                    PasswordInput(passwordController),
                    Hero(
                      tag: welcomeScreenHero,
                      child: LoginButton(
                        state: state,
                        passwordController: passwordController,
                        usernameController: usernameController,
                      ),
                    )
                    //  FirstTime(),
                  ],
                ),
              )),
    );
  }
}
