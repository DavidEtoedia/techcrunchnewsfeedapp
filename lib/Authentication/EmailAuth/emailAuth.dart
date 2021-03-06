// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';

// import 'package:food_app/AuthUI/LoginUI.dart';
// import 'package:food_app/Util/failure.dart';

// // enum FormType { signin, signup }

// class EmailSignInProvider extends ChangeNotifier {
//   FirebaseAuth auth = FirebaseAuth.instance;
//   User _user;
//   AutovalidateMode _autovalidateMode;
//   // final _formKey = GlobalKey<FormState>();

//   bool _isLogin;
//   String _userEmail;
//   String _userPassword;
//   bool _isLoading;
//   bool _isFailed;
//   String _errorText;
//   bool _errText;
//   // FormType formType;

//   EmailSignInProvider(
//     this.auth,
//     this._user,
//     this._autovalidateMode,
//     this._isLogin,
//     this._userEmail,
//     this._userPassword,
//     this._isLoading,
//     this._isFailed,
//     this._errorText,
//     this._errText,
//   ) {
//     _isLoading = false;
//     _isLogin = true;
//     _userEmail = '';
//     _userPassword = '';
//     _isFailed = true;
//     _errorText = 'Enter a Valid';
//     _errText = false;
//     // formType = FormType.signin;
//   }

//   //getters

//   bool get isFailed => _isFailed;

//   bool get errText => _errText;

//   String get errorText => _errorText;

//   User get user => _user;

//   bool get isLoading => _isLoading;

//   bool get isLogin => _isLogin;

//   String get userEmail => _userEmail;

//   String get userPassword => _userPassword;

//   AutovalidateMode get autovalidateMode => _autovalidateMode;

//   //setters

//   set isFailed(bool value) {
//     _isFailed = value;
//     notifyListeners();
//   }

//   set isLoading(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }

//   set isLogin(bool value) {
//     _isLogin = value;
//     notifyListeners();
//   }

//   set userEmail(String value) {
//     if (value != null && !value.contains('@')) {
//       _userEmail = ('Invalid enail address');
//     } else {
//       _userEmail = value;
//     }

//     _userEmail = value;
//     notifyListeners();
//   }

//   set userPassword(String value) {
//     if (value.length > 7) {
//       _userPassword = (value);
//     } else {
//       _userPassword = ('Password must contain more than 7 characters');
//     }

//     // _userPassword = value;

//     notifyListeners();
//   }

//   Future<bool> login() async {
//     try {
//       isLoading = true;

//       if (isLogin) {
//         await auth.signInWithEmailAndPassword(
//             email: userEmail, password: userPassword);
//         User? user = auth.currentUser;
//         print(user!.uid);
//       } else {
//         await auth.createUserWithEmailAndPassword(
//             email: userEmail, password: userPassword);
//       }

//       isLoading = false;

//       return true;
//     } catch (err) {
//       switch (err) {
//         case 'Email already Exist':
//           Failure(message: 'Email already exist');
//           break;
//       }
//       print(err);
//       isLoading = false;
//       return false;
//     }
//   }

//   void errorValidation() {
//     // isFailed = true;
//     if (isFailed) {
//       _autovalidateMode = AutovalidateMode.always;

//       // _errText = false;
//     } else {
//       _autovalidateMode = AutovalidateMode.disabled;
//       // _formKey.currentState.reset();
//     }

//     isFailed = false;
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is EmailSignInProvider &&
//         other.auth == auth &&
//         other._user == _user &&
//         other._autovalidateMode == _autovalidateMode &&
//         other._isLogin == _isLogin &&
//         other._userEmail == _userEmail &&
//         other._userPassword == _userPassword &&
//         other._isLoading == _isLoading &&
//         other._isFailed == _isFailed &&
//         other._errorText == _errorText &&
//         other._errText == _errText;
//   }

//   @override
//   int get hashCode {
//     return auth.hashCode ^
//         _user.hashCode ^
//         _autovalidateMode.hashCode ^
//         _isLogin.hashCode ^
//         _userEmail.hashCode ^
//         _userPassword.hashCode ^
//         _isLoading.hashCode ^
//         _isFailed.hashCode ^
//         _errorText.hashCode ^
//         _errText.hashCode;
//   }

//   @override
//   String toString() {
//     return 'EmailSignInProvider(auth: $auth, _user: $_user, _autovalidateMode: $_autovalidateMode, _isLogin: $_isLogin, _userEmail: $_userEmail, _userPassword: $_userPassword, _isLoading: $_isLoading, _isFailed: $_isFailed, _errorText: $_errorText, _errText: $_errText)';
//   }
// }

// // void moveToSignUp() {
// //   formType = FormType.signup;
// //   notifyListeners();
// // }
