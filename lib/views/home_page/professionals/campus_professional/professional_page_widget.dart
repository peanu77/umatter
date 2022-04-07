import 'package:flutter/material.dart';
import 'package:umatter/utils/colors.dart';
import 'package:umatter/utils/const.dart';

Widget professionalPageWidget({
  required title,
  required subtitle,
  required imgAsset,
  required cardColor,
  required size,
  required context,
  required route,
}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        child: Card(
          color: kCardDiscover,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 10.0),
                          width: 200.0,
                          child: Text(
                            title,
                            style: const TextStyle(fontSize: 18.0),
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          subtitle,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                    Container(
                      height: size.height * 0.15,
                      width: size.width * 0.3,
                      color: Colors.orange,
                      // child: SvgPicture.asset(imgAsset),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // primary: const Color(0xffFF9E44),
                    primary: kPrimaryColor,
                    onPrimary: Colors.black,
                  ),
                  onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => route)),
                  child: const Text(
                    'Let\'s Dive In',
                    style: kHomeCardStyle,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
