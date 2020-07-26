import 'package:Attendit/config/constant.dart';
import 'package:Attendit/features/auth/presentation/widgets/login_button.dart';
import 'package:Attendit/features/auth/presentation/widgets/sub_widgets/background.dart';
import 'package:Attendit/features/auth/presentation/widgets/sub_widgets/rounded_input_field.dart';
import 'package:Attendit/features/auth/presentation/widgets/sub_widgets/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/auth_bloc.dart';

class LoginForm extends StatelessWidget {
  final AuthState state;
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  LoginForm({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder(
          bloc: BlocProvider.of<AuthBloc>(context),
          builder: (context, state) => Background(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "AttendIt",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: size.height * 0.03),
                      SvgPicture.asset(
                        "assets/images/signup.svg",
                        height: size.height * 0.35,
                      ),
                      RoundedInputField(
                        usernameController: usernameController,
                        hintText: "Enrollment No.",
                        onChanged: (value) {},
                      ),
                      RoundedPasswordField(
                        passwordController: passwordController,
                        onChanged: (value) {},
                      ),
                      Hero(
                        tag: welcomeScreenHero,
                        child: LoginButton(
                          state: state,
                          passwordController: passwordController,
                          usernameController: usernameController,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Forgot Password?",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
