// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:open_meds/AllScreens/signuppage.dart';
// import 'package:open_meds/AllScreens/user.dart';

// class AuthenticationManager {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Stream<User> get user {
//   //   return _auth.authStateChanges();
//   //   // .map((User user) => ProfileManager().getUserFromID(user.uid));
//   //   // .map((User user) => _userFromFirebaseUser(user));
//   // }

//   User getCurrUserFromFirebase() {
//     try {
//       return _auth.currentUser;
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }

//   // sign in with email and password
//   Future signInWithEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential result = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);

//       return "success";
//     } catch (error) {
//       print(error.toString());
//       return null;
//     }
//   }


// // register a user with email and password
//   Future<dynamic> registerWithEmailAndPassword(
//       String email, String password) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       User user = result.user;
//       await user.sendEmailVerification();
//       // create a new doc for the user with new id
//       return user;
//       // return _userFromFirebaseUser(user);
//     } catch (e) {
//       // print(e.toString());
//       return e.toString();
//     }
//   }


//   Future signOut() async {
//     try {
//       print("trying to sign out");
//       return await _auth.signOut();
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
// }