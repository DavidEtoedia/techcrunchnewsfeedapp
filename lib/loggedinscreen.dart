import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/AuthUI/LoginUI.dart';
import 'package:food_app/Authentication/EmailAuth/google_login_auth/googleAuth.dart';
import 'package:food_app/Model/news_model.dart';
import 'package:food_app/Sliver/SearchBar/searchbar.dart';
import 'package:food_app/Sliver/SearchBar/sliverbar.dart';
import 'package:food_app/apicall/apiCall.dart';
import 'package:food_app/viewItem.dart';
import 'package:provider/provider.dart';

class LoggedInScreen extends StatefulWidget {
  const LoggedInScreen({Key key}) : super(key: key);

  @override
  _LoggedInScreenState createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  NewsApi newsApi = NewsApi();

  FirebaseAuth auth = FirebaseAuth.instance;
  User user;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          actions: [
            TextButton(
                onPressed: () {
                  provider.logout();

                  // .whenComplete(() => Navigator.of(context)
                  //     .pushAndRemoveUntil(
                  //         MaterialPageRoute(
                  //             builder: (context) => LoginScreen()),
                  //         (route) => false));
                  user = auth.currentUser;
                  print('$user.uid has logged out');
                },
                child: Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.w500),
                ))
          ],
        ),
        backgroundColor: Color(0xfff5f5fa),
        body: FutureBuilder<List<Article>>(
            future: newsApi.getData(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text('Loading....'),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => ViewItem(
                    article: snapshot.data[index],
                  ),
                );
              }
            }),
      ),
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
