// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/services.dart';
// // import 'package:google_sign_in/google_sign_in.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // final FirebaseAuth _auth = FirebaseAuth.instance;
// // final GoogleSignIn googleSignIn = GoogleSignIn();

// // Future<String> signInWithGoogle() async {
// //   try {
// //     final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
// //     final GoogleSignInAuthentication googleSignInAuthentication =
// //         await googleSignInAccount.authentication;

// //     final AuthCredential credential = GoogleAuthProvider.getCredential(
// //       accessToken: googleSignInAuthentication.accessToken,
// //       idToken: googleSignInAuthentication.idToken,
// //     );

// //     final AuthResult authResult = await _auth.signInWithCredential(credential);
// //     final FirebaseUser user = authResult.user;

// //     assert(!user.isAnonymous);
// //     assert(await user.getIdToken() != null);

// //     final FirebaseUser currentUser = await _auth.currentUser();
// //     assert(user.uid == currentUser.uid);

// //     return 'signInWithGoogle succeeded: $user';
// //   } on PlatformException catch (pe) {
// //     print(pe);
// //     return null;
// //   } catch (error) {
// //     print(error);
// //     return "d";
// //   }
// // }

// // void signOutGoogle() async {
// //   //Get sharedPreferece
// //   final prefs = await SharedPreferences.getInstance();
// //   //get firebase auth
// //   final FirebaseAuth fireBaseAuth = FirebaseAuth.instance;
// //   //Signout user
// //   await fireBaseAuth.signOut();
// //   //Remove session
// //   prefs.remove("userName");
// //   prefs.remove("userEmail");
// //   prefs.remove("userNumber");
// //   prefs.remove("userProfile");
// //   prefs.remove("userToken");
// //   prefs.remove("loginBy");
// //   // Authenticate();
// // }
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class Authentication {
//   // ignore: non_constant_identifier_names
//   static Future<User> signInWithGoogle({ context}) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     User user;

//     final GoogleSignIn googleSignIn = GoogleSignIn();

//     final GoogleSignInAccount googleSignInAccount =
//         await googleSignIn.signIn();

//     if (googleSignInAccount != null) {
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );

//       try {
//         final UserCredential userCredential =
//             await auth.signInWithCredential(credential);

//         user = userCredential.user;
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'account-exists-with-different-credential') {
//           // handle the error here
//         }
//         else if (e.code == 'invalid-credential') {
//           // handle the error here
//         }
//       } catch (e) {
//         // handle the error here
//       }
//     }

//     return user;
//   }
// }