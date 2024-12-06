import 'package:coffe_menu/features/appClient/domain/entities/appclient_entities.dart';

class AppclientModels extends AppclientEntities {
  const AppclientModels({
    required super.id,
    required super.appTitle,
    required super.imageLink,
  });

  factory AppclientModels.fromJson(Map<String, dynamic> json) {
    return AppclientModels(
      id: json['id'],
      appTitle: json['appTitle'],
      imageLink: json['imageLink'],
    );
  }
}
