import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Authentication/EmailAuth/emailAuth.dart';
import 'package:food_app/homepage.dart';
import 'package:provider/provider.dart';

import 'Authentication/EmailAuth/google_login_auth/googleAuth.dart';
// import 'package:food_app/homepage.dart';
// import 'package:food_app/homepage.dart';
// import 'package:food_app/sample.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
      ChangeNotifierProvider(create: (context) => EmailSignInProvider())
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      );
}
