import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart';

import '../models/cases.dart';

class ApiService {
  final String apiUrl = "http://192.168.0.102:8081/api/v1/Tarefa";

  Future<List<Cases>> getCases() async {
    Response res = await get(apiUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Cases> cases =
          body.map((dynamic item) => Cases.fromJson(item)).toList();
      return cases;
    } else if (res.statusCode == 404) {
      return <Cases>[];
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Cases> getCaseById(String id) async {
    final response = await get('$apiUrl/$id');

    if (response.statusCode == 200) {
      print("GetCaseByID:" + id);
      return Cases.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }

  Future<Cases> save(Cases cases) async {
    Map data = {
      'titulo': cases.titulo,
      'tipo': cases.tipo,
      'venc': cases.venc,
      'descricao': cases.descricao,
    };

    final Response response = await post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Cases.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }

  Future<Cases> alterar(String id, Cases cases) async {
    Map data = {
      'titulo': cases.titulo,
      'tipo': cases.tipo,
      'venc': cases.venc,
      'descricao': cases.descricao,
    };

    final Response response = await put(
      '$apiUrl/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Cases.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a case');
    }
  }

  Future<void> deleteById(String id) async {
    Response res = await delete('$apiUrl/$id');

    if (res.statusCode == 200) {
      print("Case deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }
}
