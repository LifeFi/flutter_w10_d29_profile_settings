import 'package:flutter/material.dart';

class StudyList extends StatefulWidget {
  const StudyList({super.key});

  @override
  State<StudyList> createState() => _StudyListState();
}

class _StudyListState extends State<StudyList> {
  final _list = <String>["aa", "bb", "cc", "dd", "33", "44", "55"];

  @override
  Widget build(BuildContext context) {
    final newList = _list.sublist(0, 2);
    print(_list);
    print(newList);
    const numOfPartition = 3;
    final divider = (_list.length / numOfPartition).ceil();
    print(divider);
    final List<List<String>> newListOfList = List.generate(
      numOfPartition,
      (index) => _list.sublist(index * divider,
          numOfPartition == index + 1 ? _list.length : (index + 1) * divider),
    );
    print(newListOfList);

    return const Placeholder();
  }
}
