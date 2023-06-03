class ProjectsModel {
  int id;
  String title, desc, img;
  Metas meta;

  ProjectsModel(this.id, this.title, this.desc, this.img, this.meta);
}

class Metas {
  String duration, role, outcome;

  List<String> gallery;

  Metas(this.duration, this.role, this.outcome, this.gallery);
}
