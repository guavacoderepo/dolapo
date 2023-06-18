import 'package:dolapo/constants/colors.dart';
import 'package:dolapo/models/projectsModel.dart';
import 'package:dolapo/screens/about.dart';
import 'package:dolapo/screens/contact.dart';
import 'package:dolapo/screens/view.dart';
import 'package:dolapo/utilities/fonts.dart';
import 'package:dolapo/constants/images.dart';
import 'package:dolapo/utilities/button.dart';
import 'package:dolapo/utilities/router.dart';
import 'package:dolapo/utilities/spacer.dart';
import 'package:dolapo/variables/projects.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool mobile = false;
  double size = 0;
  double maxdestop = 1040;
  double maxmobile = 855;

  List<ProjectsModel>? projectList;

  @override
  void initState() {
    projectList = projects;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width;
    mobile = MediaQuery.of(context).size.width > maxmobile ? false : true;
    return Scaffold(
      backgroundColor: light,
      // appabr section
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(logo, fit: BoxFit.contain, height: 40),
        actions: mobile
            ? null
            : [
                navButton("Home", () => push(context, const HomePage()),
                    btnColor: blue),
                navButton("About me", () => push(context, const About())),
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
                navButton("Home", () => push(context, const HomePage()),
                    btnColor: blue),
                navButton("About me", () => push(context, const About())),
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
                children: [
                  // top card
                  Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: double.infinity,
                    padding: const EdgeInsets.all(45),
                    decoration: BoxDecoration(
                      color: appColor,
                      image: const DecorationImage(
                        image: AssetImage("assets/images/topdooo.png"),
                      ),
                    ),
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
                                const Spacer(flex: 1),
                                h400(
                                    "Hi, I'm Dolapo, a UI/UX designer dedicated to crafting captivating digital experiences. With a user-centered approach and a passion for problem-solving, I create stunning interfaces that delight users. ",
                                    size > maxdestop ? 28 : 23),
                                const Spacer(flex: 1),
                                h400(
                                    "Let's explore the digital world together!",
                                    size > maxdestop ? 28 : 24,
                                    color: blue),
                                const Spacer(flex: 2),
                                submitbutton("View my resume", () {})
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 27, vertical: 20),
                    child: h500(
                      "My projects and case studies",
                      size > maxdestop ? 40 : 30,
                      color: blue,
                    ),
                  ),

// project listing
// one side alignment project listing
                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: size > maxdestop ? 90 : 50),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: projectList!
                  //         .map((e) => Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 // thumbnail section
                  //                 listImg(cnx, e),
                  //                 // description section
                  //                 listDescription(cnx, e),
                  //               ],
                  //             ))
                  //         .toList(),
                  //   ),
                  // ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size > maxdestop ? 90 : 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: projectList!
                          .map(
                            (e) => (e.id % 2) == 0
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // thumbnail section
                                      listImg(cnx, e),
                                      // description section
                                      listDescription(cnx, e),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // description section
                                      listDescription(cnx, e),
                                      // thumbnail section
                                      listImg(cnx, e),
                                    ],
                                  ),
                          )
                          .toList(),
                    ),
                  ),
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
                            18,
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
                          onPressed: () {},
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
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shadowColor: transparent,
                                backgroundColor: transparent,
                                foregroundColor: transparent,
                              ),
                              child: Image.asset("assets/icons/Twitter.png"),
                            ),
                            ElevatedButton(
                              onPressed: () {},
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

// widgets here
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

  listImg(cnx, ProjectsModel e) => Container(
        width: cnx.maxWidth * 0.4,
        height: cnx.maxWidth * 0.3,
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: blue.withOpacity(0.1),
        ),
        child: Image.asset(
          e.img,
          fit: BoxFit.contain,
        ),
      );

  listDescription(cnx, ProjectsModel e) => Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        height: cnx.maxWidth * 0.3,
        width: cnx.maxWidth * 0.425,
        // color: Colors.amber,
        padding: (e.id % 2) == 0
            ? const EdgeInsets.only(left: 5)
            : const EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // title

            SizedBox(
              width: cnx.maxWidth * 0.4,
              child: h500(e.title, size > maxdestop ? 23 : 19, color: blue),
            ),
            // description
            SizedBox(
              width: cnx.maxWidth * 0.4,
              child: h500(e.desc, size > maxdestop ? 22 : 15,
                  color: appColor.withOpacity(0.7)),
            ),
            // view project

            SizedBox(
              width: cnx.maxWidth * 0.4,
              child: InkWell(
                onTap: () => push(context, Viewproject(e)),
                focusColor: transparent,
                hoverColor: transparent,
                child: Row(
                  children: [
                    e.link
                        ? Icon(Icons.link, color: grey)
                        : Icon(Icons.mode_edit_outline_outlined, color: grey),
                    horizontal(5),
                    e.link
                        ? h500("Link", size > maxdestop ? 22 : 18, color: blue)
                        : h500("View case study", size > maxdestop ? 22 : 18,
                            color: blue),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
