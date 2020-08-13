import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'config/styles.dart';
import 'core/injection/injection.dart';
import 'core/navigator/bloc/navigator_bloc.dart';
import 'core/navigator/navigator.service.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/navbar/presentation/pages/navbar.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print('onEvent $event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('onError $error');
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('onEvent $transition');
    super.onTransition(bloc, transition);
  }
}

Future<void> main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark));
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
        title: 'ATTENDIT',
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
        },
      ),
    );
  }
}
