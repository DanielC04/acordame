import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDemoScreen extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  DocumentReference? dataRef1;
  DocumentReference? dataRef2;

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Connect'),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(
            child: Text('Create Record'),
            onPressed: () {
              createRecord();
            },
          ),
          ElevatedButton(
            child: Text('View Record'),
            onPressed: () {
              getData();
            },
          ),
          ElevatedButton(
            child: Text('Udate Record'),
            onPressed: () {
              updateData();
            },
          ),
          ElevatedButton(
            child: Text('Delete Record'),
            onPressed: () {
              deleteData();
            },
          ),
        ],
      )), //center
    );
  }

  void createRecord() {
    db.collection("tasks").add({
      'title': 'Mastering EJB',
      'description': 'Programming Guide for J2EE'
    }).then((documentSnapshot) {
      print("Added Data with ID: ${documentSnapshot.id}");
      dataRef1 = documentSnapshot;
    });
    db.collection("tasks").add({
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
    }).then((documentSnapshot) {
      dataRef2 = documentSnapshot;
    });
  }

  Future<void> getData() async {
    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }

  void updateData() {
    dataRef1?.update({'description': 'J2EE complete Reference - flippin updated'});
  }

  void deleteData() {
    dataRef1
        ?.delete()
        .then((doc) => print("Document Deleted"))
        .onError((error, stackTrace) => print("Error deleting Document"));
  }
}
