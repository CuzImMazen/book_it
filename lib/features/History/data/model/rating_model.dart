class RatingModel {
  final int stars;
  final String? comment;
  RatingModel({required this.stars, this.comment});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(stars: json['stars'], comment: json['comment']);
  }
}
