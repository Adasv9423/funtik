import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:funtik/views/widgets/screens/Profile_Screen.dart';
import 'package:funtik/views/widgets/screens/add_video_screen.dart';
import 'package:funtik/views/widgets/screens/search_screen.dart';
import 'package:funtik/views/widgets/screens/video_screen.dart';

import 'controllers/auth_controller.dart';
List pages = [
  VideoScreen(),
SearchScreen(),
  AddVideoScreen(),
 // Text('Messages Screen'),
  //Text('profile screen'),
  ProfileScreen(uid: authController.user.uid),
];

const backgroundColor = Colors.black;
var buttonColor = Colors.blue[400];
const borderColor = Colors.yellow;
var firebaseAuth=FirebaseAuth.instance;
var firebaseStorage=FirebaseStorage.instance;
var firestore=FirebaseFirestore.instance;
var authController = AuthController.instance;


