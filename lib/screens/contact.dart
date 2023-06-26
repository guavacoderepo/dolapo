import 'package:dolapo/constants/colors.dart';
import 'package:dolapo/constants/images.dart';
import 'package:dolapo/screens/about.dart';
import 'package:dolapo/screens/home.dart';
import 'package:dolapo/utilities/button.dart';
import 'package:dolapo/utilities/fonts.dart';
import 'package:dolapo/utilities/footer.dart';
import 'package:dolapo/utilities/router.dart';
import 'package:dolapo/utilities/spacer.dart';
import 'package:flutter/material.dart';


class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  bool mobile = false;
  double size = 0;
  double maxdestop = 1029;
  double maxmobile = 855;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width;
    mobile = MediaQuery.of(context).size.width > maxmobile ? false : true;
    return Scaffold(
      backgroundColor: appColor,
      // appabr section
      appBar: AppBar(
        automaticallyImplyLeading: mobile ? true : false,
        title: Image.asset(logo, fit: BoxFit.contain, height: 40),
        actions: mobile
            ? null
            : [
                navButton("Home", () => push(context, const HomePage())),
                navButton("About me", () => push(context, const About())),
                navButton("Contact me", () => push(context, const Contact()),
                    btnColor: blue),
                navButton("Playground", () {}),
              ],
        backgroundColor: appColor,
        elevation: 0,
      ),

      // drawer section

      drawer: mobile
          ? Drawer(
              width: 200,
              // backgroundColor: appColor.withOpacity(0.01),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: appColor,
                    ),
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  ListTile(
                    title: h400("Home", 19, color: btnColor),
                    onTap: () => push(context, const Contact()),
                  ),
                  ListTile(
                    title: h400("About me", 19, color: btnColor),
                    onTap: () => push(context, const About()),
                  ),
                  ListTile(
                    title: h400("Contact me", 19, color: blue),
                    onTap: () => Navigator.pop(context),
                  ),
                  ListTile(
                    title: h400("Playground", 19, color: btnColor),
                    onTap: () {},
                  ),
                ],
              ),
            )
          : null,
      body: LayoutBuilder(
        builder: (context, cnx) {
          if (cnx.maxWidth > maxmobile) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // row section
                  children: [
                    vertical(20),
                    h500("Contact me", size > maxdestop ? 40 : 30, color: blue),
                    vertical(30),

                    h400(
                      "I would love to hear from you! Whether you have a project in mind, want to discuss a collaboration, or simply have a question, feel free to reach out.",
                      size > maxdestop ? 25 : 18,
                    ),
                    vertical(20),

                    h400(
                      "With a passion for UI/UX design and a commitment to creating exceptional digital experiences, I am dedicated to bringing your vision to life. Let's work together to make something amazing.",
                      size > maxdestop ? 25 : 18,
                    ),
                    vertical(20),

                    h400(
                      "You can reach me by email at Anikejikareem@gmail.com or through twitter or linkedin. I strive to respond promptly and look forward to connecting with you.",
                      size > maxdestop ? 25 : 18,
                    ),
                    vertical(20),
                    h400(
                      "Let's turn ideas into reality. Get in touch and let's create something extraordinary!",
                      size > maxdestop ? 25 : 18,
                    ),

                    vertical(100),
                    // footer section

                    footer(context)

                    // add widges here.....
                  ],
                ),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // row section
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        vertical(20),
                        h500("Contact me", size > maxdestop ? 40 : 30,
                            color: blue),
                        vertical(30),
                        h400(
                          "I would love to hear from you! Whether you have a project in mind, want to discuss a collaboration, or simply have a question, feel free to reach out.",
                          17,
                        ),
                        vertical(20),
                        h400(
                          "With a passion for UI/UX design and a commitment to creating exceptional digital experiences, I am dedicated to bringing your vision to life. Let's work together to make something amazing.",
                          17,
                        ),
                        vertical(20),
                        h400(
                          "You can reach me by email at Anikejikareem@gmail.com or through twitter or linkedin. I strive to respond promptly and look forward to connecting with you.",
                          17,
                        ),
                        vertical(20),
                        h400(
                          "Let's turn ideas into reality. Get in touch and let's create something extraordinary!",
                          17,
                        ),
                      ],
                    ),
                  ),
                  vertical(100),
                  // footer section

                  footer(context)

                  // add widges here.....
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

