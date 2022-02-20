// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';

// class PolicyDialogPage extends StatelessWidget {
//   const PolicyDialogPage(
//       {Key? key, this.radius = 10.0, required this.mdFileName})
//       : super(key: key);

//   final double radius;
//   final String mdFileName;

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(radius),
//       ),
//       child: Column(children: [
//         Expanded(
//           child: FutureBuilder(
//             future: Future.delayed(Duration(milliseconds: 150)).then((value) {
//               return rootBundle.loadString('assets/markdown/$mdFileName');
//             }),
//             builder: ((context, snapshot) {
//               if (snapshot.hasData) {
//                 return Markdown(data: snapshot.data);
//               }
//               // if (snapshot.hasData) {
//               //   MarkDown();
//               // }
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }),
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () => Navigator.pop(context),
//           child: Text('Okay'),
//           style: ElevatedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(radius),
//               bottomRight: Radius.circular(radius),
//             ),
//           )),
//         ),
//       ]),
//     );
//   }
// }

// class MarkDown {}
