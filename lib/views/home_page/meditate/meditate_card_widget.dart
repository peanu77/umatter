import 'package:flutter/material.dart';
import 'package:umatter/constants/const.dart';

Widget meditateCardWidget({
  required title,
  required subtitle,
  required context,
  required route,
}) =>
    Card(
      elevation: 1.0,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.grey[800],
                letterSpacing: 0.5,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[600],
                letterSpacing: 0.7,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: kPrimary,
                ),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => route)),
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
