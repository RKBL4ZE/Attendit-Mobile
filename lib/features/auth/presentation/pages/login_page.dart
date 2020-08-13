import 'package:Attendit/core/environment/environment.dart';
import 'package:Attendit/core/injection/injection.dart';
import 'package:Attendit/core/navigator/bloc/navigator_bloc.dart';
import 'package:Attendit/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/LoginPage';
  @override
  Widget build(BuildContext context) {
    print('${EnvironmentConfig.APP_NAME}');
    return BlocProvider<AuthBloc>(
      create: (_) => getIt(),
      child: Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is UserLogedIn) {
            BlocProvider.of<NavigatorBloc>(context).add(NavigateToHomeEvent());
          }
          if (state is AuthError) {
            final snackBar = SnackBar(content: Text(state.message));

            Scaffold.of(context).showSnackBar(snackBar);
          }
        }, builder: (context, state) {
          return LoginForm(state: state);
        }),
      ),
    );
  }
}
