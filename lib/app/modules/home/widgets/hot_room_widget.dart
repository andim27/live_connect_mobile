import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ayas_mobile/app/ui/app_colors.dart';
import 'package:ayas_mobile/app/models/movie.dart';
import 'package:ayas_mobile/app/modules/home/widgets/title_text.dart';
import 'package:ayas_mobile/app/modules/home/widgets/extensions.dart';

class HotRoomWidget extends StatelessWidget {
  final Movie movie;
  final ValueChanged<Movie> onSelected;
  HotRoomWidget({Key key, this.movie, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100.0,
          width: 100.0,
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
          // child: Container(),
          // .ripple(() {
          //   Navigator.of(context).pushNamed('/detail');
          //   onSelected(movie);
          // }, borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(movie.name,
                        // overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: GoogleFonts.abel(fontSize: 16, fontWeight: FontWeight.bold, color: ColorBranding.white)),
                  ],
                ),
              ),
              Divider(
                color: ColorBranding.orangeLight,
                thickness: 1,
                // height: 30,
              ),
              Expanded(
                child: Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(movie.extraInfo,
                        // overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: GoogleFonts.abel(fontSize: 26, fontWeight: FontWeight.bold, color: ColorBranding.white)),
                  ],
                ),
              ),
              Divider(
                color: ColorBranding.orangeLight,
                thickness: 1,
                // height: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
