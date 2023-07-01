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
      body: OneUiNestedScrollView(
        // expandedHeight: 400,
        // toolbarHeight: 200,
        expandedWidget: const Text(
          'Contacts',
          style: TextStyle(fontSize: 30),
        ),
        leadingIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        collapsedWidget: const Text(
          'Contacts',
          style: TextStyle(fontSize: 20),
        ),
        boxDecoration: BoxDecoration(
          color: Colors.grey.shade300,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
        sliverList: SliverList(delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(backgroundColor: Colors.grey.shade300),
              title: Text('Contact $index'),
            );
          },
        )),
        // sliverBackgroundColor: Colors.blue,
      ),
    );
  }
}
