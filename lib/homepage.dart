import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/AuthUI/LoginUI.dart';
import 'package:food_app/Authentication/EmailAuth/google_login_auth/googleAuth.dart';
import 'package:food_app/apicall/apiCall.dart';
import 'package:food_app/loggedinscreen.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   NewsApi newsApi = NewsApi();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: StreamBuilder(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting)
//               return Center(child: CircularProgressIndicator());

//             return LoginScreen();
//           }

//           ),

//     );
//   }
// }

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.red,
    )

        // StreamBuilder(
        //     stream: FirebaseAuth.instance.authStateChanges(),
        //     builder: (context, snapshot) {
        //       final provider =
        //           Provider.of<GoogleSignInProvider>(context, listen: false);
        //       if (provider.isSigningIn) {
        //         return Center(child: CircularProgressIndicator());
        //       } else if (snapshot.hasData) {
        //         return LoggedInScreen();
        //       } else if (snapshot.hasError) {
        //         return Center(
        //           child: Text('Something went wrong'),
        //         );
        //       } else {
        //         return LoginScreen();
        //       }
        //     }),
        );
  }
}






// Widget viewItem(Article article, BuildContext context) {
//   return ListTile(
//     leading: CircleAvatar(backgroundImage: NetworkImage(article.urlToImage)),
//     title: Text(article.author),
//     subtitle: Text(article.title),
//     onTap: () {
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => DetailPage(
//                     user: article,
//                   )));
//     },
//   );
// }

// class DetailPage extends StatelessWidget {
//   final Article user;

//   const DetailPage({Key key, this.user}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(user.author),
//       ),
//     );
//   }
// }
