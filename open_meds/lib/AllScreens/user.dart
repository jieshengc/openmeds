// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:open_meds/AllScreens/authenticationManager.dart';

// class AppUser {
//   final String email;
//   final bool type;
//   static CollectionReference _users =
//       FirebaseFirestore.instance.collection('Users');

//   AppUser(
//       {this.email,
//       this.type,
//       });
//   factory AppUser.fromFirestore(DocumentSnapshot doc) {
//     Map data = doc.data();

//     AppUser x = AppUser(
//         email: data['email'] ?? '',
//         type: data['type'] ?? '',);
//     return x;
//   }

//   static Stream<AppUser> getUserFromID(docID) {
//     return _users
//         .doc(docID)
//         .snapshots()
//         .map((doc) => AppUser.fromFirestore(doc));
//   }

//   static Stream<AppUser> getCurrentUserObject() {
//     User currUser = AuthenticationManager().getCurrUserFromFirebase();
//     return (currUser == null) ? null : getUserFromID(currUser.email);
//   }

// }