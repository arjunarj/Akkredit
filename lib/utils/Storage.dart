import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Storage extends StatefulWidget {
  const Storage({super.key});

  @override
  State<Storage> createState() => _StorageState();
}

class _StorageState extends State<Storage> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadFile(String? name, String? path) async {
    File file = File(path!);
    try {
      await storage.ref('test/$name').putFile(file);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () async {
        final results = await FilePicker.platform.pickFiles();

        if (results == null) {
          print("no file");
        }
        final path = results?.files.single.path;
        final fileName = results?.files.single.name;

        print("Path: $path");
        print("name: $fileName");

        uploadFile(fileName, path);
      },
      child: Text("upload"),
    ));
  }
}
