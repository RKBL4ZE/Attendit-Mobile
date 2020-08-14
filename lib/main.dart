import 'package:Attendit/core/theme/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

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
        BlocProvider<AuthBloc>(create: (_) => getIt()),
        BlocProvider<ThemeBloc>(
          create: (_) => ThemeBloc(),
        )
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) => MaterialApp(
          navigatorKey: _navservice.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'ATTENDIT',
          theme: state.themeData,
          routes: {
            '/': (_) => LoginPage(),
            '/navbar': (_) => NavBar(),
          },
        ),
      ),
    );
  }
}
