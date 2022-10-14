import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class User {
  String name;
 // String profilePhoto;
  String email;
  String uid;

  User(
      {required this.name,
      required this.email,
      required this.uid,
    //  required this.profilePhoto
    });

  Null get value => null;

  Map<String, dynamic> ToString() => {
        "name": name,
     //   "profilePhoto": profilePhoto,
        "email": email,
        "uid": uid,
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      email: snapshot['email'],
   //   profilePhoto: snapshot['profilePhoto'],
      uid: snapshot['uid'],
      name: snapshot['name'],
    );
  }
}