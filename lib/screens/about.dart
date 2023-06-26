import 'package:dolapo/constants/colors.dart';
import 'package:dolapo/constants/images.dart';
import 'package:dolapo/screens/contact.dart';
import 'package:dolapo/screens/home.dart';
import 'package:dolapo/utilities/button.dart';
import 'package:dolapo/utilities/fonts.dart';
import 'package:dolapo/utilities/footer.dart';
import 'package:dolapo/utilities/router.dart';
import 'package:dolapo/utilities/spacer.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';

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
        automaticallyImplyLeading: mobile ? true : false,
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
                    onTap: () => push(context, const HomePage()),
                  ),
                  ListTile(
                    title: h400("About me", 19, color: blue),
                    onTap: () => Navigator.pop(context),
                  ),
                  ListTile(
                    title: h400("Contact me", 19, color: btnColor),
                    onTap: () => push(context, const Contact()),
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
                      "With expertise in user research, wireframing, polished interface design and UX Writing, I strive to blend aesthetics and functionality seamlessly.",
                      size > maxdestop ? 25 : 18,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 80),
                    child: h400(
                      "I understand the power of combining design and engaging content as a professional, to create an innovative product that user will find useful",
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
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 10, horizontal: 80),
                  //   child: h400(
                  //     "With expertise in user research, wireframing, and polished interface design, I strive to blend aesthetics and functionality seamlessly.",
                  //     size > maxdestop ? 25 : 18,
                  //   ),
                  // ),
                  vertical(30),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 27, vertical: 20),
                    child: h500(
                      "Recommendations",
                      size > maxdestop ? 35 : 25,
                      color: blue,
                    ),
                  ),
//
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 80),
                    child: DynamicHeightGridView(
                        itemCount: 4,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        builder: (ctx, index) {
                          return SizedBox(
                            child: Image.asset("assets/images/rec$index.png"),
                          );
                        }),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 27, vertical: 20),
                    child: h500(
                      "Certifications",
                      size > maxdestop ? 35 : 25,
                      color: blue,
                    ),
                  ),
//
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 80),
                    child: DynamicHeightGridView(
                        itemCount: 2,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        builder: (ctx, index) {
                          return SizedBox(
                            child: Image.asset("assets/images/cert$index.png"),
                          );
                        }),
                  ),

                  // footer section

                  footer(context),

// add widges here.....
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // row section
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Image.asset(
                      dollyimg2,
                      height: cnx.maxHeight * 0.7,
                      fit: BoxFit.contain,
                    ),
                  ),

                  vertical(20),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Column(
                      children: [
                        h400(
                          "Hi, I'm Dolapo, a UI/UX designer dedicated to crafting captivating digital experiences. With a user-centered approach and a passion for problem-solving, I create stunning interfaces that delight users.",
                          17,
                        ),
                        vertical(10),
                        h400(
                          "With expertise in user research, wireframing, polished interface design and UX Writing, I strive to blend aesthetics and functionality seamlessly.",
                          17,
                        ),
                        vertical(10),
                        h400(
                          "I understand the power of combining design and engaging content as a professional, to create an innovative product that user will find useful",
                          17,
                        ),
                        vertical(10),
                        h400(
                          "Collaboration, empathy, and a deep understanding of users drive my design process. ",
                          17,
                        ),
                        vertical(10),
                        h400(
                          "Let's collaborate to bring your digital vision to life and create exceptional designs together. Reach out to me today.",
                          17,
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: h500("Recommendations", 18, color: blue),
                  ),
//
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: DynamicHeightGridView(
                        itemCount: 4,
                        crossAxisCount: 1,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        builder: (ctx, index) {
                          return SizedBox(
                            child: Image.asset(
                              "assets/images/rec$index.png",
                              fit: BoxFit.cover,
                            ),
                          );
                        }),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: h500(
                      "Certifications",
                      18,
                      color: blue,
                    ),
                  ),
//
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: DynamicHeightGridView(
                        itemCount: 2,
                        crossAxisCount: 1,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        builder: (ctx, index) {
                          return SizedBox(
                            child: Image.asset(
                              "assets/images/cert$index.png",
                              fit: BoxFit.cover,
                            ),
                          );
                        }),
                  ),

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
