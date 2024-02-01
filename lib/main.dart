import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kpie_homepage/homepage4_ui.dart';
import 'package:kpie_homepage/login_page.dart';
import 'package:kpie_homepage/test.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HomePage 4',
      home:  LoginScreen(),
    );
  }
}

