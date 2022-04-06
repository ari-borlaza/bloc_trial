import 'package:flutter/material.dart';

import '../bloc_screens/bloc_consumer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, this.color})
      : super(key: key);

  final String title;
  final Color? color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.color,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: const ConsumerBloc(btncolor: Colors.amber)
        // const ListenBuildBloc(),
        );
  }
}
