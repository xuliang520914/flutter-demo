import 'package:flutter/material.dart';
import 'package:flutter_application/one_ui_nested_scroll_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'One UI Sliver AppBar',
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      // ),
      body: OneUiNestedScrollView(
        // expandedHeight: 400,
        // toolbarHeight: 200,
        expandedWidget: Text(
          'Contacts',
          style: TextStyle(fontSize: 30),
        ),
        boxDecoration: BoxDecoration(
          // color: Colors.blue,
          // gradient: LinearGradient(
          //   colors: [Colors.blue, Colors.amber],
          // ),
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
