import 'question_model.dart';

class QuizModel {
  String? title;
  List<QuestionModel>? questions;

  QuizModel({
    this.title,
    this.questions,
  });

  QuizModel.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["questions"] is List) {
      questions = json["questions"] == null
          ? null
          : List<QuestionModel>.from(json["questions"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    if (questions != null) {
      data["questions"] = questions;
    }
    return data;
  }
}
