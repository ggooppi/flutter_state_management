import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/home/base_view_model.dart';
import 'feature/home/home.dart';
import 'feature/home/screen/new/new_view_model.dart';
import 'feature/home/screen/read/read_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BaseViewModel()),
        ChangeNotifierProvider(create: (_) => NewViewModel()),
        ChangeNotifierProvider(create: (_) => ReadViewModel())
      ],
      child: MaterialApp(
        title: 'Flutter State management using Provider',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const Home(),
      ),
    );
  }
}
