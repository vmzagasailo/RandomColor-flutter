import 'package:flutter/material.dart';
import 'package:test_task/widgets/drawer.dart';
import '../theme/colors_generator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ColorsGenerator {
  Color _backroundColor = Colors.yellow;

  void _changeColor() {
    setState(() {
      _backroundColor = randomColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Random Color'),
    );

    return Scaffold(
      backgroundColor: _backroundColor,
      appBar: appBar,
      drawer: AppDrawer(),
      body: Center(
        child: GestureDetector(
          onTap: _changeColor,
          child: Text(
            'Hey there',
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
    );
  }
}
