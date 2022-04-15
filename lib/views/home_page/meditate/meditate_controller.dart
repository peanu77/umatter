import 'package:umatter/views/home_page/meditate/acoustic_guitar_page/acoustic_guitar_page.dart';
import 'package:umatter/views/home_page/meditate/instrumental/instrumental_page.dart';
import 'package:umatter/views/home_page/meditate/lofi/lofi_music.dart';
import 'package:umatter/views/home_page/meditate/meditate_info.dart';
import 'package:umatter/views/home_page/meditate/piano/piano_page.dart';

class MeditatePageController {
  List<MeditateInfoPage> meditatePageController = [
    MeditateInfoPage(
      title: "Lofi",
      subtitle:
          "Lo-fi is a music or production quality in which elements usually regarded as imperfections",
      imgAsset: '',
      route: const LofiMusicPage(),
    ),
    MeditateInfoPage(
      title: "Acoustic Music",
      subtitle:
          "Lo-fi is a music or production quality in which elements usually regarded as imperfections",
      imgAsset: '',
      route: const AcousticGuitarPage(),
    ),
    MeditateInfoPage(
      title: "Piano",
      subtitle:
          "Lo-fi is a music or production quality in which elements usually regarded as imperfections",
      imgAsset: '',
      route: const PianoPage(),
    ),
    MeditateInfoPage(
      title: "Instrumental",
      subtitle:
          "Instrumental is a music or production quality in which elements usually regarded as imperfections",
      imgAsset: '',
      route: const InstrumentalPage(),
    )
  ];
}
