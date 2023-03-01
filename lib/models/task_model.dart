import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

class TaskModel extends ChangeNotifier {
  late String _name;
  late String _description;
  late DateTime _dueTo;

  TaskModel({String name = '', String description = '', DateTime? dueTo}) {
    _name = name;
    _description = description;
    if (dueTo == null)
      _dueTo = DateTime.now();
    else
      _dueTo = dueTo;
  }

  String get name => _name;
  String get description => _description;
  DateTime get dueTo => _dueTo;

  set name(String n) {
    _name = n;
    notifyListeners();
  }

  set description(String d) {
    _description = d;
    notifyListeners();
  }

  set dueTo(DateTime d) {
    _dueTo = d;
    notifyListeners();
  }

  factory TaskModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      [SnapshotOptions? options]) {
    final data = snapshot.data();
    return TaskModel(
        name: data?['name'],
        description: data?['description'],
        dueTo: DateTime.fromMillisecondsSinceEpoch(data?['dueTo'].seconds * 1000));
  }

  Map<String, dynamic> toFirestore() {
    return {"name": _name, "description": _description, "dueTo": _dueTo};
  }
}
