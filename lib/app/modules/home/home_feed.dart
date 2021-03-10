import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:live_connect_mobile/app/ui/app_colors.dart';
import 'package:live_connect_mobile/app/services/fake_data_movie_srv.dart';
import 'package:live_connect_mobile/app/modules/home/widgets/category_list.dart';
import 'package:live_connect_mobile/app/modules/home/widgets/extensions.dart';
import 'package:live_connect_mobile/app/modules/home/widgets/hot_room_widget.dart';
import 'package:live_connect_mobile/app/modules/home/widgets/movie_card.dart';
import 'package:live_connect_mobile/app/modules/home/widgets/title_text.dart';
import 'package:live_connect_mobile/app/modules/rooms/room_page.dart';

class HomeFeed extends StatefulWidget {
  HomeFeed({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeFeedState createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  Widget _icon(IconData icon,
      {Color color = ColorBranding.orangeLight, Color bgColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color: bgColor,
      ),
      child: Icon(
        icon,
        color: color,
      ),
    );
  }

  Widget _categoryTitle() {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TitleText(
            text: 'Category',
            fontSize: 27,
            fontWeight: FontWeight.w400,
          ),
          Spacer(),
          Container(
            padding:
                EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  ColorBranding.pinkDark,
                  ColorBranding.pink,
                  ColorBranding.pinkLight,
                ],
              ),
            ),
            child: Stack(
              children: [
                Icon(
                  Icons.notifications,
                  color: ColorBranding.white,
                  size: 36.0,
                ),
                Positioned(
                  right: 13,
                  top: 8,
                  child: TitleText(
                    text: '5',
                    fontSize: 16,
                    color: ColorBranding.purpleDarkest,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryWidget() {
    return Container(
      height: 80.0,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: FakeData.categoryList
            .map((category) => CategoryListWidget(
                  model: category,
                  onSelected: (model) {
                    setState(() {
                      FakeData.categoryList.forEach((item) {
                        item.isSelected = false;
                      });
                      model.isSelected = true;
                    });
                  },
                ))
            .toList(),
      ),
    );
  }

  Widget _movieWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .45,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 4 / 3,
          mainAxisSpacing: 20,
          // crossAxisSpacing: 20,
        ),
        padding: EdgeInsets.only(left: 10),
        scrollDirection: Axis.horizontal,
        children: FakeData.movieList
            .map(
              (movie) => InkWell(
                onTap: () => Get.to(RoomPage(roomId: movie.id.toString())),
                child: MovieCard(
                  movie: movie,
                  onSelected: (model) {
                    setState(() {
                      FakeData.movieList.forEach((item) {
                        item.isSelected = false;
                      });
                      model.isSelected = true;
                    });
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _hotRoomWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .2,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1,
        ),
        // padding: EdgeInsets.only(left: 10),
        scrollDirection: Axis.horizontal,
        children: FakeData.movieList
            .map(
              (movie) => InkWell(
                onTap: () => Get.to(RoomPage(roomId: movie.id.toString())),
                child: HotRoomWidget(
                  movie: movie,
                  onSelected: (model) {
                    setState(() {
                      FakeData.movieList.forEach((item) {
                        item.isSelected = false;
                      });
                      model.isSelected = true;
                    });
                  },
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height - 210,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _categoryTitle(),
            _categoryWidget(),
            _movieWidget(),
            Container(
              margin: EdgeInsets.only(left: 10.0, top: 8.0),
              child: Divider(
                color: ColorBranding.orangeLight,
                thickness: 1,
                height: 30,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, top: 0.0, bottom: 10.0),
              child: TitleText(
                text: 'Hot Room\'s ',
                fontSize: 27,
                fontWeight: FontWeight.w400,
              ),
            ),
            _hotRoomWidget(),
          ],
        ),
      ),
    );
  }
}
