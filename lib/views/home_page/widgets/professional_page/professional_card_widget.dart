import 'package:flutter/material.dart';
import 'package:umatter/constants/const.dart';

Widget professionalCardWidget({
  required context,
  required width,
  required title,
  required subtitle,
  required cardColor,
  required btnText,
  required btnColor,
  required route,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: cardColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: kPrimary,
                  onPrimary: Colors.white,
                  elevation: 1.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => route)),
              child: Text(
                btnText,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
