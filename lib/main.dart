import 'package:flutter/material.dart';
import 'package:my_flutter_chat/common/routing.dart';
import 'package:my_flutter_chat/feature/presentation/pages/friends/list_friends_page.dart';
import 'package:my_flutter_chat/feature/presentation/pages/list_chat/list_chat_page.dart';
import 'package:my_flutter_chat/feature/presentation/pages/profile/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AppRouting appRouting = AppRouting();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListFriendsPage(),
      // initialRoute: appRouting.getInitialRoute(),
      // routes: appRouting.routes(),
    );
  }
}
