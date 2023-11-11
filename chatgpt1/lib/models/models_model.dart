import 'package:flutter/material.dart';

class ModelsModel {
  final String id;
  final int created;
  final String root;

  ModelsModel({required this.id, required this.created, required this.root});

  factory ModelsModel.fromJSON(Map<String, dynamic> json) => ModelsModel(
        id: json["id"],
        created: json["created"],
        root: json["root"],
      );
  static List<ModelsModel> modelsFromSnapShot(List model) {
    return model.map((data) => ModelsModel.fromJSON(data)).toList();
  }
}
