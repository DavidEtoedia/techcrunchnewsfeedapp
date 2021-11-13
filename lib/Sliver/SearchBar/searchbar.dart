import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      sliver: SliverAppBar(
        backgroundColor: Color(0xfff5f5fa),
        pinned: true,
        titleSpacing: 20,
        title: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 30)),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
