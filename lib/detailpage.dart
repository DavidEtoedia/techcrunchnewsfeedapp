// import 'package:flutter/material.dart';

// import 'core/services/api/Model/news_model.dart';

// class DetailPage extends StatelessWidget {
//   final Article article;

//   const DetailPage({Key? key, required this.article}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 10, right: 10, top: 10),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(0),
//                 child: Image(image: NetworkImage(article.urlToImage!)),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, right: 7),
//               child: Text(
//                 article.content.toString(),
//                 style: TextStyle(fontSize: 18),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
