import 'package:dolapo/constants/colors.dart';
import 'package:dolapo/utilities/fonts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

footer(context) => Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.2,
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: appColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: h400(
              "Ready to bring your digital vision to life? Let's collaborate and create something amazing together. Get in touch with me today!",
              13,
              align: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Divider(
              color: grey,
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              shadowColor: transparent,
              backgroundColor: transparent,
              foregroundColor: transparent,
            ),
            onPressed: () async => await canLaunchUrl(Uri(
              scheme: 'mailto',
              path: 'Anikejikareem@gmail.com',
            )),
            icon: Icon(
              Icons.mail_outline_outlined,
              color: blue,
            ),
            label: h400("Anikejikareem@gmail.com", 15, color: blue),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _launchUrl(
                  "https://mobile.twitter.com/Dolapo_writes",
                ),
                style: ElevatedButton.styleFrom(
                  shadowColor: transparent,
                  backgroundColor: transparent,
                  foregroundColor: transparent,
                ),
                child: Image.asset(
                  "assets/icons/Twitter.png",
                  height: 24,
                ),
              ),
              ElevatedButton(
                onPressed: () => _launchUrl(
                    "https://www.linkedin.com/in/dolapouiuxdesigner"),
                style: ElevatedButton.styleFrom(
                  shadowColor: transparent,
                  backgroundColor: transparent,
                  foregroundColor: transparent,
                ),
                child: Image.asset(
                  "assets/icons/LinkedIn .png",
                  height: 24,
                ),
              ),
            ],
          )
        ],
      ),
    );

Future<void> _launchUrl(url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
