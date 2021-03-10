import 'package:live_connect_mobile/app/models/category.dart';
import 'package:live_connect_mobile/app/models/movie.dart';

class FakeData {
  static List<Movie> movieList = [
    Movie(
        id: 1,
        name: 'The Matrix',
        extraInfo: "2000",
        isSelected: true,
        image: 'assets/images/matrix.png',
        category: "Movies"),
    Movie(
        id: 2,
        name: 'Real Madrid - Barcelona',
        extraInfo: "Live",
        image: 'assets/images/rm-barca.png',
        category: "Sport"),
    Movie(
        id: 1,
        name: 'The Lost Interview',
        extraInfo: "on HBO",
        image: 'assets/images/lostinterview.png',
        category: "Documentary"),
    Movie(
        id: 2,
        name: 'The Flash',
        extraInfo: "on HBO",
        image: 'assets/images/the-flash.png',
        category: "TV-Series"),
    Movie(
        id: 1,
        name: 'Interstellar',
        extraInfo: "2018",
        image: 'assets/images/interstellar.png',
        category: "Trending Now"),
    Movie(
        id: 2,
        name: 'Social Dilemma',
        extraInfo: "on NETFLIX",
        image: 'assets/images/socialdilemma.png',
        category: "Documentary"),
  ];

  static List<Category> categoryList = [
    Category(),
    Category(id: 1, name: "Movies", isSelected: true),
    Category(id: 2, name: "TV-Series"),
    Category(id: 3, name: "Sport"),
    Category(id: 4, name: "Documentary"),
    Category(id: 5, name: "Trending Now"),
  ];
  static List<String> showThumbnailList = [
    "assets/images/-.png",
    "assets/images/-.png",
    "assets/images/-.png",
    "assets/images/-.png",
    "assets/images/-.png",
  ];
  static String description =
      "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
}
