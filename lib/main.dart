import 'package:flutter/material.dart';
import 'package:my_flutter_chat/core/routing.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouterDelegate = AppRouteDelegate();
    final appRouteInformationParser = AppInformationParser();
    final appRouteObserver = RouteObserver();
    return ChangeNotifierProvider<AppRouteDelegate>.value(
      value: appRouterDelegate,
      child: Provider<RouteObserver>.value(
        value: appRouteObserver,
        child: Builder(
          builder: (context) {
            return Consumer<AppRouteDelegate>(
              builder: (context, delegate, _) {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  routerDelegate: appRouterDelegate,
                  routeInformationParser: appRouteInformationParser,
                );
              },
            );
          },
        ),
      ),
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: appRouterDelegate,
      routeInformationProvider: null,
      routeInformationParser: appRouteInformationParser,
    );
  }
}
