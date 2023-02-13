import 'package:flutter/material.dart';
import 'package:uidesign/customs/BorderIcon.dart';
import 'package:uidesign/customs/OptionButton.dart';
import 'package:uidesign/sample_data.dart';
import 'package:uidesign/screens/DetailPage.dart';
import 'package:uidesign/utils/constants.dart';
import 'package:uidesign/utils/widget_functions.dart';

import '../utils/custom_functions.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Column(
//              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Row(
                    //                  mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      BorderIcon(
                        Icon(
                          Icons.menu,
                          color: COLOR_BLACK,
                        ),
                        EdgeInsets.all(25),
                        50,
                        50,
                      ),
                      BorderIcon(
                          Icon(
                            Icons.settings,
                          ),
                          EdgeInsets.all(25),
                          50.0,
                          50.0),
                    ],
                  ),
                ),
                addVerticalSpace(20),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    "City",
                    style: themeData.textTheme.bodyText2,
                  ),
                ),
                addVerticalSpace(10),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    "San Francisco",
                    style: themeData.textTheme.headline1,
                  ),
                ),
                Padding(
                  padding: sidePadding,
                  child: Divider(
                    height: 25,
                    color: COLOR_GREY,
                  ),
                ),
                addVerticalSpace(10),
                Expanded(
                    child: Padding(
                  padding: sidePadding,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: RE_DATA.length,
                      itemBuilder: (context, index) {
                        return RealEstateItem(
                          itemData: RE_DATA[index],
                        );
                      }),
                ))
              ],
            ),
            Positioned(
              bottom: 20,
              width: size.width,
              child: Center(
                child: OptionButton(
                  text: "Map View",
                  icon: Icons.map_rounded,
                  width: size.width * 0.35,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({required Key key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: COLOR_GREY.withAlpha(25),
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({Key? key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(itemData: itemData)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(itemData['image']),
                ),
                Positioned(
                    top: 15,
                    right: 15,
                    child: BorderIcon(
                        const Icon(
                          Icons.favorite_border,
                          color: COLOR_BLACK,
                        ),
                        const EdgeInsets.all(25),
                        50,
                        50)),
              ],
            ),
            addVerticalSpace(15),
            Row(
              children: [
                Text(
                  "${formatCurrency(itemData["amount"])}",
                  style: themeData.textTheme.headline1,
                ),
                addHorizontalSpace(10),
                Text(
                  "${itemData["address"]}",
                  style: themeData.textTheme.bodyText2,
                ),
              ],
            ),
            addVerticalSpace(10),
            Text(
              "${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]}"
              " bathrooms / ${itemData["area"]}sqft",
              style: themeData.textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}
