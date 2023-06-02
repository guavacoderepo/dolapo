import 'package:dolapo/constants/colors.dart';
import 'package:dolapo/utilities/fonts.dart';
import 'package:dolapo/constants/images.dart';
import 'package:dolapo/utilities/button.dart';
import 'package:dolapo/utilities/spacer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> navItems = [
    navButton("Home", () {}),
    navButton("About me", () {}),
    navButton("Contact me", () {}),
    navButton("Playground", () {}),
  ];

  bool mobile = false;

  @override
  Widget build(BuildContext context) {
    mobile = MediaQuery.of(context).size.width > 700 ? false : true;
    return Scaffold(
      // appabr section
      appBar: AppBar(
        title: Image.asset(logo, fit: BoxFit.contain, height: 40),
        actions: mobile ? null : navItems,
        backgroundColor: appColor,
        elevation: 0,
      ),

      // drawer section

      drawer: mobile
          ? Drawer(
              child: ListView(children: navItems),
            )
          : null,

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top card
            Container(
              color: appColor,
              height: MediaQuery.of(context).size.height * 0.7,
              width: double.infinity,
              padding: const EdgeInsets.all(45),
              // row contents
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // text section of row
                  SizedBox(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          h400(
                              "Hi, I'm Dolapo, a UI/UX designer dedicated to crafting captivating digital experiences. With a user-centered approach and a passion for problem-solving, I create stunning interfaces that delight users. ",
                              29),
                          vertical(50),
                          h400("Let's explore the digital world together!", 28,
                              color: blue),
                          vertical(80),
                          submitbutton("Download Resume", () {})
                        ],
                      ),
                    ),
                  ),
                  // image section
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                        image: DecorationImage(
                          image: AssetImage(dollyimg),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
// title text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
              child: h500("My projects and case studies", 40, color: blue),
            ),

// project listing




// widgets here
          ],
        ),
      ),
    );
  }
}
