class RequsetDataModel {
  final String message;
  final String id;

  RequsetDataModel({required this.id, required this.message});

  factory RequsetDataModel.fromjson(json) {
    return RequsetDataModel(message: json['nessage'], id: json['id']);
  }
}
