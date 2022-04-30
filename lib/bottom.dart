import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom({
    Key? key,
    required this.onNumberChanged,
  }) : super(key: key);

  final void Function(List<int>) onNumberChanged;

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  final List<int> _inputs = [];

  void _handleNumberTap(int number) {
    print(number);

    if (_inputs.contains(number)) {
      return;
    }
    if (_inputs.length >= 3) {
      return;
    }
    setState(() {
      _inputs.add(number);
      widget.onNumberChanged(_inputs);
    });
  }

  void _handleClearTap() {
    print("지우기 ");

    if (_inputs.isEmpty) {
      return;
    }
    setState(() {
      _inputs.removeLast();
      widget.onNumberChanged(_inputs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.blue,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            _inputs.join(" "),
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          _createNumberPad(),
        ],
      ),
    );
  }

  Widget _createNumberPad() {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        _createNumberButton(1),
        _createNumberButton(2),
        _createNumberButton(3),
        _createNumberButton(4),
        _createNumberButton(5),
        _createNumberButton(6),
        _createNumberButton(7),
        _createNumberButton(8),
        _createNumberButton(9),
        _createClearButton()
      ],
    );
  }

  Widget _createNumberButton(int number) {
    return SizedBox(
      width: 70,
      height: 70,
      child: ElevatedButton(
        onPressed: () => _handleNumberTap(number),
        child: Text("$number"),
        style: ElevatedButton.styleFrom(
          primary: Colors.red,
        ),
      ),
    );
  }

  Widget _createClearButton() {
    return SizedBox(
      width: 70,
      height: 70,
      child: ElevatedButton(
        onPressed: _handleClearTap,
        child: Text("지움"),
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
        ),
      ),
    );
  }
}
