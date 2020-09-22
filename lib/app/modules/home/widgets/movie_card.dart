import 'package:flutter/material.dart';
import 'package:ayas_mobile/app/ui/app_colors.dart';
import 'package:ayas_mobile/app/models/movie.dart';
import 'package:ayas_mobile/app/modules/home/widgets/title_text.dart';
import 'package:ayas_mobile/app/modules/home/widgets/extensions.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final ValueChanged<Movie> onSelected;
  MovieCard({Key key, this.movie, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(movie.image),
        ),
        border: Border.all(
          color: ColorBranding.pink,
          width: 2,
        ),
        color: ColorBranding.orangeDark,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        // boxShadow: <BoxShadow>[
        //   BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        // ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleText(
            text: movie.name,
            fontSize: 24,
          ),
          TitleText(
            text: movie.category,
            fontSize: 18,
          ),
          TitleText(
            text: movie.extraInfo,
            fontSize: 16,
          ),
        ],
      ),
      // .ripple(() {
      //   Navigator.of(context).pushNamed('/detail');
      //   onSelected(movie);
      // }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
