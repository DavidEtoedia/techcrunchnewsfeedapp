// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// import 'package:food_app/detailpage.dart';

// import 'core/services/api/Model/news_model.dart';

// class ViewItem extends StatelessWidget {
//   final Article article;
//   const ViewItem({
//     Key? key,
//     required this.article,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: 19, right: 19),
//       child: Column(
//         children: [
//           InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => DetailPage(
//                             article: article,
//                           )));
//             },
//             child: Container(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: CachedNetworkImage(
//                     placeholder: (context, url) => CircularProgressIndicator(),
//                     imageUrl: article.urlToImage!),
//                 // child: Image(
//                 //   image: NetworkImage(article.urlToImage),
//                 // ),
//               ),
//             ),
//           ),
//           // Padding(
//           //   padding: const EdgeInsets.only(right: 200),
//           //   child: Text(article.author),
//           // ),
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             article.title.toString(),
//             style: TextStyle(fontSize: 19),
//           ),
//           SizedBox(
//             height: 20,
//           ),

//           Row(
//             children: [
//               Image(
//                 image: AssetImage('assets/images/techcrunch.png'),
//                 height: 20,
//                 width: 20,
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 'TECHCRUNCH',
//                 style: TextStyle(fontWeight: FontWeight.w500),
//               ),
//               SizedBox(width: 140),
//               Row(
//                 children: [
//                   Icon(
//                     Icons.favorite_border_outlined,
//                     color: Colors.grey,
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Icon(
//                     Icons.ios_share,
//                     color: Colors.grey,
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Icon(
//                     Icons.tune_outlined,
//                     color: Colors.grey,
//                   ),
//                 ],
//               )
//             ],
//           ),

//           Divider(
//             color: Colors.grey,
//           ),
//           SizedBox(
//             height: 20,
//           )
//         ],
//       ),
//     );
//   }
// }
