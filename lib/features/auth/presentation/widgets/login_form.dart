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
/* 	 @override
  void dispose() {
    password.dispose();
    super.dispose();
  } */
  final AuthState state;
  /* final password = TextEditingController();
  final username = TextEditingController(); */

  LoginForm({Key key, this.state}) : super(key: key);
  
  //static const routeName = '/LoginPage';
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
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          VerticalText(),
                          TextLogin(),
                        ]),
                        Inputusername(),
                        PasswordInput(),
                        Hero(
                          tag: welcomeScreenHero,
                          child: LoginButton(
                            state: state,
                          ),
                        )
                        //  FirstTime(),
                      ],
                    ),
                  ],
                ),
              )),
    );
  }
}
