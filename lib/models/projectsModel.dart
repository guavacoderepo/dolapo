import 'dart:convert';

class ProjectsModel {
    bool? status;
    List<Datum>? data;

    ProjectsModel({
         this.status,
         this.data,
    });

    factory ProjectsModel.fromJson(String str) => ProjectsModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProjectsModel.fromMap(Map<String, dynamic> json) => ProjectsModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
    };
}

class Datum {
    Meta? meta;
    String? id;
    String? title;
    String? description;
    String? thumbnail;
    bool? isLink;
    String? link;
    bool? isCaseStudy;
    String? caseStudy;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Datum({
         this.meta,
         this.id,
         this.title,
         this.description,
         this.thumbnail,
         this.isLink,
         this.link,
         this.isCaseStudy,
         this.caseStudy,
         this.createdAt,
         this.updatedAt,
         this.v,
    });

    factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        meta: Meta.fromMap(json["Meta"]),
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        isLink: json["isLink"],
        link: json["link"],
        isCaseStudy: json["isCaseStudy"],
        caseStudy: json["caseStudy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toMap() => {
        "Meta": meta!.toMap(),
        "_id": id,
        "title": title,
        "description": description,
        "thumbnail": thumbnail,
        "isLink": isLink,
        "link": link,
        "isCaseStudy": isCaseStudy,
        "caseStudy": caseStudy,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "__v": v,
    };
}

class Meta {
    String? duration;
    String? role;
    String? outcome;
    List<String>? gallery;

    Meta({
         this.duration,
         this.role,
         this.outcome,
         this.gallery,
    });

    factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        duration: json["duration"],
        role: json["role"],
        outcome: json["outcome"],
        gallery: List<String>.from(json["gallery"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "duration": duration,
        "role": role,
        "outcome": outcome,
        "gallery": List<dynamic>.from(gallery!.map((x) => x)),
    };
}

