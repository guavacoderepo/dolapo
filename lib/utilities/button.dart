import 'package:dolapo/constants/colors.dart';
import 'package:dolapo/utilities/fonts.dart';
import 'package:flutter/material.dart';

navButton(title, VoidCallback onPressed,
        {Color btnColor = const Color(0xffD9D9D9)}) =>
    ElevatedButton(
      onPressed: onPressed,
      child: h400(title, 19, color: btnColor),
      // onHover: (value) =>  ,

      style: ElevatedButton.styleFrom(
        backgroundColor: transparent,
        foregroundColor: transparent,
        shadowColor: transparent,
      ),
    );

submitbutton(
  title,
  VoidCallback onPressed,
) =>
    ElevatedButton(
      onPressed: onPressed,
      child: h400(title, 19),
      // onHover: (value) =>  ,

      style: ElevatedButton.styleFrom(
        backgroundColor: transparent,
        foregroundColor: transparent,
        shadowColor: transparent,
        padding: const EdgeInsets.all(20),
        shape: StadiumBorder(side: BorderSide(color: grey)),
      ),
    );
