import 'package:equatable/equatable.dart';

class AppclientEntities extends Equatable {
  final int id;
  final String appTitle;
  final String imageLink;

  const AppclientEntities({
    required this.id,
    required this.appTitle,
    required this.imageLink,
  });

  @override
  List<Object?> get props => [id, appTitle, imageLink];
}
