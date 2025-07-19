class OnBoardingModel {
  String image;
  String title;
  String description;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  String toString() =>
      'OnBoardingModel(image: $image, title: $title, description: $description)';
}
