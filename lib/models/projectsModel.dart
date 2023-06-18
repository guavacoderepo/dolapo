class ProjectsModel {
  int id;
  String title, desc, img;
  bool link;
  Metas meta;

  ProjectsModel(this.id, this.title, this.desc, this.img, this.meta, this.link);
}

class Metas {
  String duration, role, outcome;

  List<String> gallery;

  Metas(this.duration, this.role, this.outcome, this.gallery);
}
