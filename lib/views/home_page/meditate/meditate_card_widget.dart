import 'package:flutter/material.dart';
import 'package:umatter/constants/const.dart';

Widget meditateCardWidget({
  required size,
  required title,
  required subtitle,
  required cardColor,
  required btnColor,
  required btnText,
  required imgAsset,
  required context,
  required route,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Card(
        elevation: 10.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 8.0,
                top: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          title,
                          style: const TextStyle(
                              fontSize: 18.0, color: Colors.black),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      SizedBox(
                        width: size.width * 0.5,
                        child: Text(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 14.0,
                            letterSpacing: 1.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: size.height * 0.19,

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
                style: kHomeButton,
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => route)),
                child: Text(
                  btnText,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
