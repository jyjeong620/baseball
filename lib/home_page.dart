import 'package:baseball/quiz.dart';
import 'package:baseball/top.dart';
import 'package:baseball/bottom.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Quiz _quiz;

  final List<int> _inputNumbers = [];

  @override
  void initState() {
    super.initState();
    _quiz = Quiz();
  }

  void _handleNumberChanged(List<int> inputNumbers) {
    _inputNumbers.clear();
    _inputNumbers.addAll(inputNumbers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("야구 게임"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Top(quiz: _quiz),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _quiz = Quiz();
              });
            },
            child: Text("Reload"),
          ),
          ElevatedButton(
            onPressed: () {
              final isEquals = listEquals(_quiz.answer, _inputNumbers);
              print("정답인가 ? $isEquals ");
            },
            child: Text("Check"),
          ),
          Bottom(
            onNumberChanged: _handleNumberChanged,
          ),
        ],
      ),
    );
  }
}
