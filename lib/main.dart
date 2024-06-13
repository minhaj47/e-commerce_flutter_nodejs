import 'package:ecommerce_app_flutter_nodejs/features/auth/screens/auth_screen.dart';
import 'package:ecommerce_app_flutter_nodejs/provider/user_provider.dart';
import 'package:ecommerce_app_flutter_nodejs/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'material-theme/theme.dart';
import 'material-theme/util.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Actor", "Asap");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      //theme: theme.light(),
      onGenerateRoute: (routeSettings) => generateRoute(routeSettings),
      home: const AuthScreen(),
    );
  }
}
