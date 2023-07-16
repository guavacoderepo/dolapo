import 'package:dolapo/constants/colors.dart';
import 'package:dolapo/models/projectclass.dart';
import 'package:dolapo/models/projectsModel.dart';
import 'package:dolapo/screens/about.dart';
import 'package:dolapo/screens/contact.dart';
import 'package:dolapo/screens/view.dart';
import 'package:dolapo/utilities/fonts.dart';
import 'package:dolapo/constants/images.dart';
import 'package:dolapo/utilities/button.dart';
import 'package:dolapo/utilities/footer.dart';
import 'package:dolapo/utilities/router.dart';
import 'package:dolapo/utilities/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

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

  late Future projectList;

  @override
  void initState() {
    projectList = getprojects();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width;
    mobile = MediaQuery.of(context).size.width > maxmobile ? false : true;
    return Scaffold(
//       backgroundColor: light,
      // appabr section
      appBar: AppBar(
        automaticallyImplyLeading: mobile ? true : false,
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
                    title: h400("Home", 19, color: blue),
                    onTap: () => Navigator.pop(context),
                  ),
                  ListTile(
                    title: h400("About me", 19, color: btnColor),
                    onTap: () => push(context, const About()),
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
                                    "Hi, I'm Dolapo, a versatile UI/UX designer and UX writer. With a keen eye for aesthetics and a passion for crafting seamless user experiences, I bring creative designs to life while ensuring intuitive and engaging content that resonates with users.",
                                    size > maxdestop ? 28 : 23),
                                const Spacer(flex: 1),
                                h400(
                                    "Let's explore the digital world together!",
                                    size > maxdestop ? 28 : 24,
                                    color: blue),
                                const Spacer(flex: 2),
                                submitbutton(
                                  "View my resume",
                                  () => _launchUrl(
                                    "https://resume.io/r/rDEGY0HH2",
                                  ),
                                )
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
                    child: FutureBuilder<ProjectsModel>(
                      future: getprojects(),
                      builder: (context, snap) {
                        if (snap.hasData) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: snap.data!.data!
                                .map(
                                  (e) => (e.id) == 0
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
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      },
                    ),
                  ),
// footer section
                  footer(context)
// widgets here
                ],
              ),
            );
          } else {
// mobile view
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // top card
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.8,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: appColor,
                      image: const DecorationImage(
                        image: AssetImage("assets/images/topdooo.png"),
                      ),
                    ),
                    // row contents
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // image section

                        Image.asset(
                          dollyimg,
                          height: MediaQuery.of(context).size.height * 0.35,
                        ),

                        // text section of row
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: h400(
                            "Hi, I'm Dolapo, a versatile UI/UX designer and UX writer. With a keen eye for aesthetics and a passion for crafting seamless user experiences, I bring creative designs to life while ensuring intuitive and engaging content that resonates with users.",
                            18,
                            align: TextAlign.center,
                          ),
                        ),

                        vertical(20),
                        h400("Let's explore the digital world together!", 15,
                            color: blue),
                        vertical(20),
                        submitbutton("View my resume",
                            () => _launchUrl("https://resume.io/r/JGGsUqAv7"),
                            size: 15),
                        vertical(20),
                      ],
                    ),
                  ),
// title text
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 27, vertical: 20),
                    child: h500(
                      "My projects and case studies",
                      20,
                      color: blue,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: FutureBuilder<ProjectsModel>(
                      future: getprojects(),
                      builder: (context, snap) {
                        if (snap.hasData) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: snap.data!.data!
                                .map((e) => Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // thumbnail section
                                        Container(
                                          width: double.infinity,
                                          height: cnx.maxWidth * 0.5,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 15),
                                          padding: const EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: blue.withOpacity(0.1),
                                          ),
                                          child: FadeInImage.assetNetwork(
                                            placeholder:
                                                "assets/images/p-h.png",
                                            image: e.thumbnail!,
                                            fit: BoxFit.contain,
                                          ),
                                        ),

                                        // description section
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 6),
                                          // height: cnx.maxWidth * 0.3,
                                          width: double.infinity,
                                          // color: Colors.amber,
                                          // padding:
                                          //     EdgeInsets.symmetric(horizontal: 30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              // title
                                              h500(e.title, 18, color: blue),
                                              h500(
                                                e.description,
                                                16,
                                                color:
                                                    appColor.withOpacity(0.7),
                                              ),

                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: InkWell(
                                                  onTap: !e.isLink!
                                                      ? () => _launchUrl(e.link)
                                                      : () => push(context,
                                                          Viewproject(e)),
                                                  focusColor: transparent,
                                                  hoverColor: transparent,
                                                  child: Row(
                                                    children: [
                                                      e.isLink!
                                                          ? Icon(Icons.link,
                                                              color: btnColor,
                                                              size: 20)
                                                          : Icon(
                                                              Icons
                                                                  .mode_edit_outline_outlined,
                                                              size: 20,
                                                              color: btnColor),
                                                      horizontal(5),
                                                      e.isLink!
                                                          ? h500("Link", 15,
                                                              color: blue)
                                                          : h500(
                                                              "View case study",
                                                              15,
                                                              color: blue,
                                                            ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ))
                                .toList(),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        }
                      },
                    ),
                  ),
// footer section
                  footer(context)

// widgets here
                ],
              ),
            );
          }
        },
      ),
    );
  }

  listImg(cnx, Datum e) => Container(
        width: cnx.maxWidth * 0.4,
        height: cnx.maxWidth * 0.3,
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: blue.withOpacity(0.1),
        ),
        child: FadeInImage.assetNetwork(
          placeholder: "assets/images/p-h.png",
          image: e.thumbnail!,
          fit: BoxFit.contain,
        ),
      );

  listDescription(cnx, Datum e) => Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        height: cnx.maxWidth * 0.3,
        width: cnx.maxWidth * 0.425,
        // color: Colors.amber,
        padding: (e.id) == 0
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
              child: h500(e.description, size > maxdestop ? 22 : 15,
                  color: appColor.withOpacity(0.7)),
            ),
            // view project

            SizedBox(
              width: cnx.maxWidth * 0.4,
              child: InkWell(
                onTap: e.isLink!
                    ? () => _launchUrl(e.link)
                    : () => push(context, Viewproject(e)),
                focusColor: transparent,
                hoverColor: transparent,
                child: Row(
                  children: [
                    e.isLink!
                        ? Icon(Icons.link, color: btnColor)
                        : Icon(Icons.mode_edit_outline_outlined,
                            color: btnColor),
                    horizontal(5),
                    e.isLink!
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

Future<void> _launchUrl(url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
