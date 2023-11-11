class QuestionModel {
  String? title;
  List<String>? answers;

  QuestionModel({this.title, this.answers});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    if (json["email"] is String) {
      title = json["email"];
    }
    if (json["likes"] is List) {
      answers = json["likes"] == null ? null : List<String>.from(json["likes"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = title;
    if (answers != null) {
      data["likes"] = answers;
    }
    return data;
  }
}
