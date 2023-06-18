import 'package:dolapo/constants/colors.dart';
import 'package:dolapo/constants/images.dart';
import 'package:dolapo/screens/contact.dart';
import 'package:dolapo/screens/home.dart';
import 'package:dolapo/utilities/button.dart';
import 'package:dolapo/utilities/fonts.dart';
import 'package:dolapo/utilities/router.dart';
import 'package:dolapo/utilities/spacer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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
        automaticallyImplyLeading: false,
        title: Image.asset(logo, fit: BoxFit.contain, height: 40),
        actions: mobile
            ? null
            : [
                navButton("Home", () => push(context, const HomePage())),
                navButton("About me", () => push(context, const About()),
                    btnColor: blue),
                navButton("Contact me", () => push(context, const Contact())),
                navButton("Playground", () {}),
              ],
        backgroundColor: appColor,
        elevation: 0,
      ),

      // drawer section

      drawer: mobile
          ? Drawer(
              child: ListView(children: [
                navButton("Home", () => push(context, const HomePage())),
                navButton("About me", () => push(context, const About()),
                    btnColor: blue),
                navButton("Contact me", () => push(context, const Contact())),
                navButton("Playground", () {}),
              ]),
            )
          : null,
      body: LayoutBuilder(
        builder: (context, cnx) {
          if (cnx.maxWidth > maxmobile) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // row section
                children: [
                  vertical(100),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.39,
                          child: Image.asset(
                            dollyimg2,
                            height: cnx.maxHeight * 0.7,
                            fit: BoxFit.contain,
                          ),
                        ),
                        horizontal(10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: h400(
                            "Hi, I'm Dolapo, a UI/UX designer dedicated to crafting captivating digital experiences. With a user-centered approach and a passion for problem-solving, I create stunning interfaces that delight users.",
                            size > maxdestop ? 28 : 18,
                          ),
                        )
                      ],
                    ),
                  ),

                  vertical(50),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 80),
                    child: h400(
                      "With expertise in user research, wireframing, and polished interface design, I strive to blend aesthetics and functionality seamlessly.",
                      size > maxdestop ? 25 : 18,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 80),
                    child: h400(
                      "I understand the power of concise and compelling copy as a UX writer, creating cohesive narratives that enhance the overall user experience.",
                      size > maxdestop ? 25 : 18,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 80),
                    child: h400(
                      "Collaboration, empathy, and a deep understanding of users drive my design process. ",
                      size > maxdestop ? 25 : 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 80),
                    child: h400(
                      "Let's collaborate to bring your digital vision to life and create exceptional designs together. Reach out to me today.",
                      size > maxdestop ? 25 : 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 80),
                    child: h400(
                      "With expertise in user research, wireframing, and polished interface design, I strive to blend aesthetics and functionality seamlessly.",
                      size > maxdestop ? 25 : 18,
                    ),
                  ),
                  vertical(100),
                  // footer section

                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    color: appColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          child: h400(
                            "Ready to bring your digital vision to life? Let's collaborate and create something amazing together. Get in touch with me today!",
                            size > maxdestop ? 18 : 15,
                            align: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 140),
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
                          label:
                              h400("Anikejikareem@gmail.com", 18, color: blue),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => _launchUrl(
                                  "https://mobile.twitter.com/Dolapo_writes"),
                              style: ElevatedButton.styleFrom(
                                shadowColor: transparent,
                                backgroundColor: transparent,
                                foregroundColor: transparent,
                              ),
                              child: Image.asset("assets/icons/Twitter.png"),
                            ),
                            ElevatedButton(
                              onPressed: () => _launchUrl(
                                  "https://www.linkedin.com/in/dolapouiuxdesigner"),
                              style: ElevatedButton.styleFrom(
                                shadowColor: transparent,
                                backgroundColor: transparent,
                                foregroundColor: transparent,
                              ),
                              child: Image.asset("assets/icons/LinkedIn .png"),
                            ),
                          ],
                        )
                      ],
                    ),
                  )

// add widges here.....
                ],
              ),
            );
          } else {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  h400("Mobile view coming soon...", 20, color: blue),
                  horizontal(5),
                  CircularProgressIndicator(
                    color: blue,
                    strokeWidth: 2,
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

Future<void> _launchUrl(_url) async {
  if (!await launchUrl(Uri.parse(_url))) {
    throw Exception('Could not launch $_url');
  }
}
