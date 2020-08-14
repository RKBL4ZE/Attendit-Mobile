import 'package:Attendit/config/constant.dart';
import 'package:Attendit/features/auth/presentation/widgets/login_button.dart';
import 'package:Attendit/features/auth/presentation/widgets/sub_widgets/background.dart';
import 'package:Attendit/features/auth/presentation/widgets/sub_widgets/rounded_input_field.dart';
import 'package:Attendit/features/auth/presentation/widgets/sub_widgets/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/auth_bloc.dart';
import 'sub_widgets/rounded_new_password_field.dart';

class LoginForm extends StatelessWidget {
  final AuthState state;
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final newPasswordController = TextEditingController();
  LoginForm({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder(
          cubit: BlocProvider.of<AuthBloc>(context),
          builder: (context, state) => Background(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SvgPicture.asset(
                          'assets/images/logo.svg',
                          //color: Colors.black,
                          height: 120,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RoundedInputField(
                          usernameController: () {
                            if (state is UserNewPassword) {
                              return usernameController..text = state.username;
                            }
                            return usernameController;
                          }(),
                          hintText: "Enrollment No.",
                          enabled: () {
                            if (state is UserNewPassword) {
                              return false;
                            }
                            return true;
                          }(),
                          onChanged: (value) {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RoundedPasswordField(
                          passwordController: () {
                            if (state is UserNewPassword) {
                              return passwordController..text = state.password;
                            }
                            return passwordController;
                          }(),
                          enabled: () {
                            if (state is UserNewPassword) {
                              return false;
                            }
                            return true;
                          }(),
                          hintText: "Password",
                          onChanged: (value) {},
                        ),
                        (state is UserNewPassword)
                            ? RoundedNewPasswordField(
                                newPasswordController: newPasswordController,
                                hintText: "New Password",
                                onChanged: (value) {},
                              )
                            : Container(),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password?",
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Hero(
                          tag: welcomeScreenHero,
                          child: LoginButton(
                            state: state,
                            passwordController: passwordController,
                            usernameController: usernameController,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
