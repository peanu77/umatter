import 'package:flutter/material.dart';

class CampusProfessionalsInfo extends StatefulWidget {
  const CampusProfessionalsInfo({Key? key}) : super(key: key);

  @override
  _CampusProfessionalsInfoState createState() =>
      _CampusProfessionalsInfoState();
}

class _CampusProfessionalsInfoState extends State<CampusProfessionalsInfo> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: _size.height * 0.40,
              width: double.infinity,
              color: Colors.green,
              child: const Text('Profile'),
            ),
            SizedBox(
              height: _size.height * 0.05,
            ),
            Container(
              height: _size.height * 0.47,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Colors.orange,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 30.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: Therese Paloma Palacpac',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      'Profession: Guidance Counselor',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      'Building No: ',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      'Floor : ',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(
                      'Room No: ',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Office Hours',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              '8:00 - 11:59 AM',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Office Hours',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              '1:00 - 5:00 PM',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
        ),
      ),
    );
  }
}
