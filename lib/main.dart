import 'package:ecommerce_app_flutter_nodejs/common/widget/bottom_navigation_bar.dart';
import 'package:ecommerce_app_flutter_nodejs/features/admin/screen/admin_screen.dart';
import 'package:ecommerce_app_flutter_nodejs/features/auth/screens/auth_screen.dart';
import 'package:ecommerce_app_flutter_nodejs/features/auth/services/auth_services.dart';
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
  final AuthServices authServices = AuthServices();

  @override
  void initState() {
    super.initState();
    authServices.getData(context);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    TextTheme textTheme = createTextTheme(context, "Actor", "Asap");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      //theme: theme.light(),
      onGenerateRoute: (routeSettings) => generateRoute(routeSettings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const AuthScreen(),
    );
  }
}
