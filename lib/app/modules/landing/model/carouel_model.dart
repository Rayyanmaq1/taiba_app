class CarouselObject {
  const CarouselObject({
    required this.title,
    required this.image,
  });

  factory CarouselObject.fromJson(Map<String, dynamic> json) {
    return CarouselObject(
      title: json['title'],
      image: json['image'],
    );
  }

  final String title;
  final String image;
}
