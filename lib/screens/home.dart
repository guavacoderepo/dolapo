import 'package:dolapo/constants/colors.dart';
import 'package:dolapo/models/projectsModel.dart';
import 'package:dolapo/utilities/fonts.dart';
import 'package:dolapo/constants/images.dart';
import 'package:dolapo/utilities/button.dart';
import 'package:dolapo/utilities/spacer.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  double size = 0;
  double maxdestop = 1029;
  double maxmobile = 855;

  List<ProjectsModel> projectList = [
    ProjectsModel(
        0,
        "STOCKOPEDIA",
        "Stockopedia is a mobile app that helps users to invest smarter and better",
        "assets/images/stockopedia.png"),
    ProjectsModel(1, "FOOYEE", "Book your website with no stress",
        "assets/images/fooyee.png"),
    ProjectsModel(2, "FOOYEE ", "Book your website with no stress",
        "assets/images/fooyee2.png"),
    ProjectsModel(
        3,
        "KRYPTAL",
        "Web3 centralized cryptocurrency trading platform",
        "assets/images/kryptal.png"),
    ProjectsModel(4, "MIEZ", "Luxurious spa and beauty saloon website",
        "assets/images/miez.png")
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width;
    mobile = MediaQuery.of(context).size.width > maxmobile ? false : true;
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 27, vertical: 20),
                    child: h500(
                      "My projects and case studies",
                      size > maxdestop ? 40 : 30,
                      color: blue,
                    ),
                  ),

// project listing

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size > maxdestop ? 30 : 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: projectList
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
                        // Row(
                        //   children: [
                        //     IconButton(onPressed: (){}, icon: FaIcon())
                        //   ],
                        // )
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
        width: cnx.maxWidth * 0.52,
        height: cnx.maxWidth * 0.45,
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: blue.withOpacity(0.1),
        ),
        child: Image.asset(
          e.img,
          fit: BoxFit.cover,
        ),
      );

  listDescription(cnx, ProjectsModel e) => Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        height: cnx.maxWidth * 0.45,
        width: cnx.maxWidth * 0.4,
        padding: (e.id % 2) == 0
            ? const EdgeInsets.only(left: 50)
            : const EdgeInsets.only(right: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // title

            SizedBox(
              width: cnx.maxWidth * 0.4,
              child: h500(e.title, size > maxdestop ? 35 : 30, color: blue),
            ),
            // description
            SizedBox(
              width: cnx.maxWidth * 0.4,
              child: h500(e.desc, size > maxdestop ? 25 : 20,
                  color: appColor.withOpacity(0.5)),
            ),
            // view project
            SizedBox(
              width: cnx.maxWidth * 0.4,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shadowColor: transparent,
                    backgroundColor: transparent,
                    foregroundColor: transparent,
                    padding: EdgeInsets.zero),
                onPressed: () {},
                icon: Icon(Icons.edit_square, color: grey),
                label: h500("View case study", size > maxdestop ? 25 : 20,
                    color: blue),
              ),
            )
          ],
        ),
      );
}
