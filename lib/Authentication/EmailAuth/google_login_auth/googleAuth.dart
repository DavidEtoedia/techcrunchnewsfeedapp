// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class GoogleSignInProvider extends ChangeNotifier {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   User _user;

//   final googleSignIn = GoogleSignIn();

//   bool _isSigningIn;

//   GoogleSignInProvider(
//     this.auth,
//     this._user,
//     this._isSigningIn,
//   ) {
//     _isSigningIn = false;
//   }

//   User get user => _user;

//   bool get isSigningIn => _isSigningIn;

//   set isSigningIn(bool isSigningIn) {
//     _isSigningIn = isSigningIn;
//     notifyListeners();
//   }

//   // GoogleSignInAccount _user;

//   // GoogleSignInAccount get user => _user;

//   Future login() async {
//     try {
//       isSigningIn = true;
//       final googleUser = await googleSignIn.signIn();

//       if (googleUser == null) {
//         _isSigningIn = false;
//       } else {
//         final googleAuth = await googleUser.authentication;
//         final credential = GoogleAuthProvider.credential(
//             accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

//         await FirebaseAuth.instance.signInWithCredential(credential);

//         isSigningIn = false;
//       }
//     } catch (err) {
//       print(err.toString());
//     }

//     notifyListeners();
//   }

//   Future logout() async {
//     User? user = auth.currentUser;

//     await auth.signOut();
//     print('$user.uid is signed out');

//     if (await googleSignIn.isSignedIn()) {
//       await googleSignIn.disconnect();
//       print('logged out with google');
//     }

//     notifyListeners();
//   }
// }

// // class EmailSignInProvider extends ChangeNotifier{}