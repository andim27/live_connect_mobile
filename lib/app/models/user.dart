import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;
  String avatarURL;
  DateTime createdAt;
  DateTime updatedAt;

  UserModel({this.id, this.name, this.email, this.avatarURL, this.createdAt, this.updatedAt});

  UserModel.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    //name = documentSnapshot.["name"];
    //email = documentSnapshot["email"];
  }
  String createRandomNum() {
    int randomNum = Random().nextInt(999999);
    return randomNum.toString();
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name ?? email.substring(0, email.indexOf('@')) + createRandomNum(),
      'avatarURL': avatarURL ?? 'https://via.placeholder.com/150',
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
      'updatedAt': updatedAt ?? FieldValue.serverTimestamp(),
    };
  }
}
