import 'dart:convert';

import 'package:dolapo/models/projectsModel.dart';
import 'package:http/http.dart' as http;

Future<ProjectsModel> getprojects() async {
  final uri = Uri.parse("https://dolapo-designs.onrender.com/projects/json");

  var client = http.Client();
  try {
    var res = await client.get(uri);

    if (res.statusCode == 200) {
      var result = json.decode(res.body);

      return result;
    } else {
      throw Exception();
    }
  } finally {
    client.close();
  }
}
