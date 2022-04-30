import 'dart:math';

class Quiz {
  Quiz() {
    Set<int> filter = {};
    while (filter.length < 3) {
      filter.add(_naturalNumber);
    }
    final tmp = filter.toList();
    tmp.sort();
    _answer = List.unmodifiable(tmp);
  }

  late final List<int> _answer;
  List<int> get answer => _answer;

  int get _naturalNumber => Random().nextInt(9) + 1;
}
