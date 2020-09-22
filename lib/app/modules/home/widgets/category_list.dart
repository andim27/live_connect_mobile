import 'package:flutter/material.dart';
import 'package:ayas_mobile/app/ui/app_colors.dart';
import 'package:ayas_mobile/app/models/category.dart';
import 'package:ayas_mobile/app/modules/home/widgets/title_text.dart';
import 'package:ayas_mobile/app/modules/home/widgets/extensions.dart';

class CategoryListWidget extends StatelessWidget {
  // final String imagePath;
  // final String text;
  final ValueChanged<Category> onSelected;
  final Category model;
  CategoryListWidget({Key key, this.model, this.onSelected}) : super(key: key);

  Widget build(BuildContext context) {
    return model.id == null
        ? Container(width: 5)
        : Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            child: Container(
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    ColorBranding.pinkDark,
                    ColorBranding.pink,
                    ColorBranding.pinkLight,
                  ],
                ),
                color: model.isSelected ? ColorBranding.purpleDarkest : Colors.transparent,
                border: Border.all(
                  color: model.isSelected ? ColorBranding.pink : ColorBranding.orange,
                  width: model.isSelected ? 4 : 1,
                ),
                // boxShadow: <BoxShadow>[
                //   BoxShadow(
                //     color: model.isSelected ? Color(0xfffbf2ef) : Colors.white,
                //     blurRadius: 10,
                //     spreadRadius: 5,
                //     offset: Offset(5, 5),
                //   ),
                // ],
              ),
              child: Row(
                children: <Widget>[
                  model.name == null
                      ? Container()
                      : Container(
                          child: TitleText(
                            text: model.name,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        )
                ],
              ),
            ).ripple(
              () {
                onSelected(model);
              },
              borderRadius: BorderRadius.all(Radius.circular(60)),
            ),
          );
  }
}
