import 'package:dolapo/constants/colors.dart';
import 'package:dolapo/constants/images.dart';
import 'package:dolapo/models/projectsModel.dart';
import 'package:dolapo/utilities/button.dart';
import 'package:dolapo/utilities/fonts.dart';
import 'package:dolapo/utilities/spacer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Viewproject extends StatefulWidget {
  final Datum projectItem;

  const Viewproject(this.projectItem, {super.key});

  @override
  State<Viewproject> createState() => _ViewprojectState();
}

class _ViewprojectState extends State<Viewproject> {
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

      // appbar section
      appBar: AppBar(
        title: Image.asset(logo, fit: BoxFit.contain, height: 40),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: navButton("Back Home", () => Navigator.pop(context),
                btnColor: blue),
          )
        ],
        backgroundColor: appColor,
        elevation: 0,
      ),

      // body section

      body: LayoutBuilder(
        builder: (context, ctx) {
          if (ctx.maxWidth > maxdestop) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        h500(widget.projectItem.title, 40, color: blue),
                        vertical(20),
                        h400("Role: ${widget.projectItem.meta!.role}", 25),
                        vertical(20),
                        h400("Duration: ${widget.projectItem.meta!.duration}",
                            25),
                        vertical(20),
                        h400(
                            "Outcome: ${widget.projectItem.meta!.outcome}", 25),
                      ],
                    ),
                  ),
                  vertical(20),

                  // list images
                  Column(
                    children: widget.projectItem.meta!.gallery!
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 100, vertical: 10),
                            child: Image.asset(e),
                          ),
                        )
                        .toList(),
                  ),
// check if case study exit for this design
                  widget.projectItem.isCaseStudy!
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: navButton(
                                  "View Full Case Study On Behance",
                                  () =>
                                      _launchUrl(widget.projectItem.caseStudy),
                                  size: 15,
                                  btnColor: blue),
                            ),
                          ),
                        )
                      : vertical(10),
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        h500(widget.projectItem.title, 21, color: blue),
                        vertical(10),
                        h400("Role: ${widget.projectItem.meta!.role}", 17),
                        vertical(10),
                        h400("Duration: ${widget.projectItem.meta!.duration}",
                            17),
                        vertical(10),
                        h400(
                            "Outcome: ${widget.projectItem.meta!.outcome}", 17),
                      ],
                    ),
                  ),
                  vertical(20),

                  // list images
                  Column(
                    children: widget.projectItem.meta!.gallery!
                        .map(
                          (e) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: FadeInImage.assetNetwork(
                              placeholder: "assets/images/p-h.png",
                              image: e,
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                        .toList(),
                  ),
// check if case study exit for this design
                  widget.projectItem.isCaseStudy!
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: navButton(
                                  "View Full Case Study On Behance",
                                  () =>
                                      _launchUrl(widget.projectItem.caseStudy),
                                  size: 15,
                                  btnColor: blue),
                            ),
                          ),
                        )
                      : vertical(10),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

Future<void> _launchUrl(url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
