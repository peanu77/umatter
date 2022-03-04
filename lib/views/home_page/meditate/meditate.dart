import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/meditate/acoustic_guitar_page/acoustic_guitar_page.dart';
import 'package:umatter/views/home_page/meditate/lofi/lofi_music.dart';

class MeditatePage extends StatelessWidget {
  const MeditatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Music Therapy',
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              letterSpacing: 1.0,
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    // Lofi
                    InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LofiMusicPage(),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.orange,
                          image: const DecorationImage(
                            image: AssetImage('assets/img/lofi.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: _size.height * 0.25,
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    // Acoustic
                    InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AcousticGuitarPage(),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/img/acoustic_guitar.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: _size.height * 0.25,
                        width: double.infinity,
                      ),
                    ),
                    // Piano
                    const SizedBox(
                      height: 15.0,
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AcousticGuitarPage(),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.orange,
                          image: const DecorationImage(
                            image: AssetImage(
                              'assets/img/piano.jpg',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: _size.height * 0.25,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
