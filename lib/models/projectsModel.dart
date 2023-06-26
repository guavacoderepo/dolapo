class ProjectsModel {
  int id;
  String title, desc, img;
  bool isLink;
  String? link;
  bool isCaseStudy;
  String? caseStudy;
  Metas meta;

  ProjectsModel(this.id, this.title, this.desc, this.img, this.meta, this.isLink, this.link, this.isCaseStudy, this.caseStudy);
}

class Metas {
  String duration, role, outcome;

  List<String> gallery;

  Metas(this.duration, this.role, this.outcome, this.gallery);
}
