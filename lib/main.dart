import 'package:Attendit/core/navigator/bloc/navigator_bloc.dart';
import 'package:Attendit/core/navigator/navigator.service.dart';
import 'package:Attendit/features/auth/presentation/bloc/auth_bloc.dart';

import 'package:Attendit/features/navbar/presentation/pages/navbar.dart';
import 'package:Attendit/features/timetable/presentation/widgets/full_timetable.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'core/injection/injection.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'config/styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
     systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark
      ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final NavigationService _navservice = getIt<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigatorBloc>(
            create: (_) =>
                NavigatorBloc(navigatorKey: _navservice.navigatorKey)),
        BlocProvider<AuthBloc>(create: (_) => getIt())
      ],
      child: MaterialApp(
        navigatorKey: _navservice.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'AttendIt Student',
        theme: ThemeData.light().copyWith(
          primaryColor: PrimaryStyle.primary,
          accentColor: PrimaryStyle.accent,
          //textTheme:TextTheme(headline6: TextStyle(color: Colors.black) ),
          splashColor: PrimaryStyle.splash,
          primaryColorBrightness: Brightness.light,
          //accentColor: Color.fromRGBO(255, 255, 255, 1),
          //fontFamily: 'Karala',
        ),
        routes: {
          '/': (_) => LoginPage(),
          '/navbar': (_) => NavBar(),
          '/fulltimetable': (_) => FullTimeTablePage()
        },
      ),
    );
  }
}
