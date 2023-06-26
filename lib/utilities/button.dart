import 'package:dolapo/constants/colors.dart';
import 'package:dolapo/utilities/fonts.dart';
import 'package:flutter/material.dart';

navButton(title, VoidCallback onPressed,
        {Color btnColor = const Color(0xffD9D9D9), double size = 19}) =>
    ElevatedButton(
      onPressed: onPressed,
      child: h400(title, size, color: btnColor),
      // onHover: (value) =>  ,

      style: ElevatedButton.styleFrom(
        backgroundColor: transparent,
        foregroundColor: transparent,
        shadowColor: transparent,
      ),
    );

submitbutton(title, VoidCallback onPressed, {double size = 19}) =>
    ElevatedButton(
      onPressed: onPressed,
      child: h400(title, size),
      // onHover: (value) =>  ,

      style: ElevatedButton.styleFrom(
        backgroundColor: transparent,
        foregroundColor: transparent,
        shadowColor: transparent,
        padding: const EdgeInsets.all(16),
        shape: StadiumBorder(side: BorderSide(color: grey)),
      ),
    );
