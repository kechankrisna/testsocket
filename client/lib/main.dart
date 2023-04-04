import 'package:flutter/material.dart';


import 'client_socket_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Test Socket',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ClientSocketPage());
  }
}
