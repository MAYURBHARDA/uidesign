import 'package:flutter/material.dart';
import 'package:uidesign/customs/BorderIcon.dart';
import 'package:uidesign/utils/constants.dart';
import 'package:uidesign/utils/custom_functions.dart';
import 'package:uidesign/utils/widget_functions.dart';

class DetailPage extends StatelessWidget {
  final dynamic itemData;

  const DetailPage({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
      child: Scaffold(
        backgroundColor: COLOR_WHITE,
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.asset(itemData["image"]),
                        Positioned(
                          width: size.width,
                          top: padding,
                          child: Padding(
                            padding: sidePadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: BorderIcon(
                                      const Icon(
                                        Icons.keyboard_backspace,
                                        color: COLOR_BLACK,
                                      ),
                                      const EdgeInsets.all(25),
                                      50,
                                      50),
                                ),
                                BorderIcon(
                                    const Icon(
                                      Icons.favorite_border,
                                      color: COLOR_BLACK,
                                    ),
                                    const EdgeInsets.all(25),
                                    50,
                                    50),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                formatCurrency(itemData["amount"]),
                                style: themeData.textTheme.headline1,
                              ),
                              addVerticalSpace(5),
                              Text(
                                "\$${itemData["address"]}",
                                style: themeData.textTheme.subtitle2,
                              ),
                            ],
                          ),
                          BorderIcon(
                              Text(
                                "20 Hours ago",
                                style: themeData.textTheme.headline5,
                              ),
                              const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              20,
                              20),
                        ],
                      ),
                    ),
                    addVerticalSpace(padding),
                    Padding(
                      padding: sidePadding,
                      child: Text(
                        "House "
                        "Information",
                        style: themeData.textTheme.headline4,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

    return Container();
  }
}
