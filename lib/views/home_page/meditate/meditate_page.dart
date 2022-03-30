// import 'package:flutter/material.dart';
// import 'package:umatter/views/home_page/meditate/acoustic_guitar_page/acoustic_guitar_page.dart';
// import 'package:umatter/views/home_page/meditate/lofi/lofi_music.dart';

// class MeditatePage extends StatelessWidget {
//   const MeditatePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final _size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(
//               Icons.chevron_left,
//               color: Colors.black,
//             ),
//           ),
//           title: const Text(
//             'Music Therapy',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 22.0,
//               letterSpacing: 1.0,
//             ),
//           ),
//           centerTitle: true,
//           elevation: 0.0,
//           backgroundColor: Colors.transparent,
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 15.0,
//                 ),
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 15.0),
//                     // Lofi
//                     InkWell(
//                       onTap: () => Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => const LofiMusicPage(),
//                         ),
//                       ),
//                       child: Container(
//                         // decoration: BoxDecoration(
//                         //   borderRadius: BorderRadius.circular(15.0),
//                         //   color: Colors.orange,
//                         //   image: const DecorationImage(
//                         //     image:
//                         //         AssetImage('assets/img/music_therapy/lofi.jpg'),
//                         //     fit: BoxFit.fill,
//                         //   ),
//                         // ),
//                         height: _size.height * 0.25,
//                         width: double.infinity,
//                         color: Colors.orange,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15.0,
//                     ),
//                     // Acoustic
//                     InkWell(
//                       onTap: () => Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => const AcousticGuitarPage(),
//                         ),
//                       ),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15.0),
//                           image: const DecorationImage(
//                             image: AssetImage(
//                                 'assets/img/music_therapy/acoustic_guitar.jpg'),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         height: _size.height * 0.25,
//                         width: double.infinity,
//                       ),
//                     ),
//                     // Piano
//                     const SizedBox(
//                       height: 15.0,
//                     ),
//                     InkWell(
//                       onTap: () => Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => const AcousticGuitarPage(),
//                         ),
//                       ),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(15.0),
//                           color: Colors.orange,
//                           image: const DecorationImage(
//                             image: AssetImage(
//                               'assets/img/music_therapy/piano.jpg',
//                             ),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         height: _size.height * 0.25,
//                         width: double.infinity,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:umatter/constants/const.dart';
import 'package:umatter/views/home_page/meditate/meditate_card_widget.dart';
import 'package:umatter/views/home_page/meditate/meditate_controller.dart';

class MeditatePage extends StatefulWidget {
  const MeditatePage({Key? key}) : super(key: key);

  @override
  State<MeditatePage> createState() => _MeditatePageState();
}

class _MeditatePageState extends State<MeditatePage> {
  final _meditatePageController = MeditatePageController();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.chevron_left, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text(
              'Music Therapy',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          backgroundColor: Colors.orange.shade50,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30.0),
                meditateCardWidget(
                  size: _size,
                  title:
                      _meditatePageController.meditatePageController[0].title,
                  subtitle: _meditatePageController
                      .meditatePageController[0].subtitle,
                  cardColor: Colors.white,
                  btnColor: kPrimary,
                  btnText: 'Go!',
                  imgAsset: '',
                  context: context,
                  route:
                      _meditatePageController.meditatePageController[0].route,
                ),
                meditateCardWidget(
                  size: _size,
                  title:
                      _meditatePageController.meditatePageController[1].title,
                  subtitle: _meditatePageController
                      .meditatePageController[1].subtitle,
                  cardColor: Colors.white,
                  btnColor: kPrimary,
                  btnText: 'Go!',
                  imgAsset: '',
                  context: context,
                  route:
                      _meditatePageController.meditatePageController[1].route,
                ),
                meditateCardWidget(
                    size: _size,
                    title:
                        _meditatePageController.meditatePageController[2].title,
                    subtitle: _meditatePageController
                        .meditatePageController[2].subtitle,
                    cardColor: Colors.white,
                    btnColor: kPrimary,
                    btnText: 'Go!',
                    imgAsset: '',
                    context: context,
                    route: _meditatePageController
                        .meditatePageController[2].route),
                const SizedBox(height: 30.0),
              ],
            ),
          )),
    );
  }
}
