class DetailModel {
  final String image;
  final String name;

  DetailModel({required this.image, required this.name});
}

class ReviewHotel {
  final String image;
  final String name;
  final String dec;
  final int ratings;

  ReviewHotel(
      {required this.image,
      required this.name,
      required this.dec,
      required this.ratings});
}
