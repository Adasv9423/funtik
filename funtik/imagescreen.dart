import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'img_upload.dart';
// import 'package:timetable/file_upload_firebase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Imgscreen());
}

class Imgscreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImageUploads(),
    );
  }
}

