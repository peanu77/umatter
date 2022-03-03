import 'package:flutter/material.dart';
import 'package:umatter/views/home_page/meditate/lofi_music.dart';

class MeditatePage extends StatelessWidget {
  const MeditatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Meditate',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LofiMusicPage(),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.orange,
                  ),
                  height: _size.height * 0.2,
                  width: double.infinity,
                  child: const Text('Container'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
