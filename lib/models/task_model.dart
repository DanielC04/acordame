import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

class TaskModel extends ChangeNotifier {
  late String id;
  late String _name;
  late String _description;
  late DateTime _dueTo;

  TaskModel(
      {required String this.id,
      String name = '',
      String description = '',
      DateTime? dueTo}) {
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
    print("updating description");
    _description = d;
    notifyListeners();
  }

  set dueTo(DateTime d) {
    _dueTo = d;
    notifyListeners();
  }

  set year(int y){
    _dueTo = DateTime(
        y, _dueTo.month, _dueTo.day, _dueTo.hour, _dueTo.minute, _dueTo.second);
    notifyListeners();
  }

  set month(int m){
    _dueTo = DateTime(
        _dueTo.year, m, _dueTo.day, _dueTo.hour, _dueTo.minute, _dueTo.second);
    notifyListeners();
  }

  set day(int d){
    _dueTo = DateTime(
        _dueTo.year, _dueTo.month, d, _dueTo.hour, _dueTo.minute, _dueTo.second);
    notifyListeners();
  }

  set hour(int h) {
    _dueTo = DateTime(
        _dueTo.year, _dueTo.month, _dueTo.day, h, _dueTo.minute, _dueTo.second);
    notifyListeners();
  }

  set minutes(int m) {
    print("setting minutes to $m");
    _dueTo = DateTime(
        _dueTo.year, _dueTo.month, _dueTo.day, _dueTo.hour, m, _dueTo.second);
    notifyListeners();
  }

  factory TaskModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      [SnapshotOptions? options]) {
    final data = snapshot.data();
    return TaskModel(
        id: snapshot.id,
        name: data?['name'],
        description: data?['description'],
        dueTo:
            DateTime.fromMillisecondsSinceEpoch(data?['dueTo'].seconds * 1000));
  }

  Map<String, dynamic> toFirestore() {
    return {"name": _name, "description": _description, "dueTo": _dueTo};
  }

  saveChangesToFirestore() async {
    print("trying to save changes");
    print(toFirestore());
    final db = FirebaseFirestore.instance;
    if (id == '') {
      // tasks wasn't saved until now
      final doc = await db.collection("tasks").add(toFirestore());
      id = doc.id;
    }
    db.collection("tasks").doc(id).update(toFirestore());
  }
}
