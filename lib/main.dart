import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/first_activity.dart';

void main() => runApp(const MaterialApp(home: App()));

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.orange,
          primaryColor: Colors.orange),
    );
  }
}
