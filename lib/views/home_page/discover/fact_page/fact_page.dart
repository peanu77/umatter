import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:umatter/controllers/discover_controller/fact_controller.dart';

class FactPage extends StatefulWidget {
  const FactPage({Key? key}) : super(key: key);

  @override
  State<FactPage> createState() => _FactPagePageState();
}

class _FactPagePageState extends State<FactPage> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _factCheck = FactCheckController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.chevron_left, color: Colors.black)),
          title: Text(
            'Facts',
            style: Theme.of(context).textTheme.headline4,
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            PageView.builder(
              itemCount: _factCheck.factCheckInfo.length,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.orange),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15.0),
                          child: Text(
                            _factCheck.factCheckInfo[index].desc,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Teacher Lottie
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: _size.width * 0.5,
                        child: Column(
                          children: [
                            Lottie.asset('assets/img/discover/teacher.json'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
