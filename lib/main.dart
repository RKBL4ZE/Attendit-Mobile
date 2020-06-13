import 'package:Attendit/core/navigator/bloc/navigator_bloc.dart';

import 'package:Attendit/features/navbar/presentation/pages/navbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'core/injection/injection.dart';
import 'features/auth/presentation/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color.fromRGBO(95, 197, 209, 1),
      systemNavigationBarIconBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigatorBloc>(
      create: (_) => NavigatorBloc(navigatorKey: _navigatorKey),
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,

        //title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Karala',
        ),
        routes: {
          '/': (_) => NavBar(),
          '/navbar': (_) => NavBar(),
        },
      ),
    );
  }
}
