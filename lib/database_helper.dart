// import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';

// class Databasefunction {
//   uploaduserInfo(userMap) {
//     FirebaseFirestore.instance..collection("users").document().setData(userMap);
//   }

//   getusername(String username) async {
//     return  FirebaseFirestore.instance
//         .collection("users")
//         .where("name", isEqualTo: username)
//         .startAtDocument;
//   }
// }
