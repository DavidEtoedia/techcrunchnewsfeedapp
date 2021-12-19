import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_app/Authentication/EmailAuth/emailAuth.dart';
import 'package:food_app/homepage.dart';
import 'package:food_app/ui/screens/Home_screen.dart';
import 'package:food_app/ui/widgets/news_display_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'Authentication/EmailAuth/google_login_auth/googleAuth.dart';
// import 'package:food_app/homepage.dart';
// import 'package:food_app/homepage.dart';
// import 'package:food_app/sample.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(428, 926),
        builder: () => MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: HomeScreen(),
              debugShowCheckedModeBanner: false,
            ));
  }
}
