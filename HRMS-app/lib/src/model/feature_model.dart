import 'package:hrms/src/utils/utils.dart';

class FeatureModel {
  String title;
  String image;
  OnSubmit onPressed;

  FeatureModel({
    required this.title,
    required this.image,
    required this.onPressed,
  });
}
