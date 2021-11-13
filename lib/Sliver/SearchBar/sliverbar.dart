import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/Authentication/EmailAuth/google_login_auth/googleAuth.dart';
import 'package:provider/provider.dart';

class Sliverbar extends StatefulWidget {
  const Sliverbar({Key key}) : super(key: key);

  @override
  _SliverbarState createState() => _SliverbarState();
}

class _SliverbarState extends State<Sliverbar> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    bool isEmail;

    return SliverAppBar(
        // title: Text(
        //   'Hello',
        //   style: TextStyle(fontSize: 40),
        // ),
        // centerTitle: true,
        backgroundColor: Color(0xfff5f5fa),
        expandedHeight: 90,
        floating: false,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          size: 30,
          color: Colors.black,
        ),
        actions: [
          Stack(
            children: [
              if (user.photoURL != null)
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: InkWell(
                    onTap: () {
                      provider.logout();
                    },
                    child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(user.photoURL)),
                  ),
                ),
            ],
          )
        ],
        flexibleSpace: FlexibleSpaceBar(
          title: isEmail
              ? null
              : Text(
                  'Welcome' + " " + user.displayName + "  " + '😃',
                  style: TextStyle(color: Colors.black, fontSize: 11),
                ),
          titlePadding: EdgeInsets.only(left: 30),
          collapseMode: CollapseMode.parallax,
          // background: Container(
          //   color: Colors.white,
          // ),
        ));
  }
}
