import 'package:chatgpt/models/models_model.dart';
import 'package:chatgpt/services/api_services.dart';
import 'package:flutter/cupertino.dart';

class ModelProvider with ChangeNotifier {
  String currentmodel = "text-davinci-003";

  String get getCurrentModel {
    return currentmodel;
  }

  void setCurrentModel(String newModel) {
    currentmodel = newModel;
    notifyListeners();
  }

  List<ModelsModel> modelsList = [];
  List<ModelsModel> get getModelsList {
    return modelsList;
  }

  Future<List<ModelsModel>> getAllModels() async {
    modelsList = await ApiServices.getModels();
    return modelsList;
  }
}
