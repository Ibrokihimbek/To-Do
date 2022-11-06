import 'package:flutter/animation.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';

class CotegoryToDo {
  String iconName;
  String cotegoryNAme;
  Color color;

  CotegoryToDo({
    required this.iconName,
    required this.cotegoryNAme,
    required this.color,
  });

  static List<CotegoryToDo> cotegories = [
    CotegoryToDo(
      color: MyColors.C_FF9680,
      iconName: MyImages.icon_work,
      cotegoryNAme: 'Work',
    ),
    CotegoryToDo(
        color: MyColors.C_80FFFF,
        iconName: MyImages.icon_sport,
        cotegoryNAme: 'Sport'),
    CotegoryToDo(
        color: MyColors.C_8875FF,
        iconName: MyImages.icon_universty,
        cotegoryNAme: 'University'),
    CotegoryToDo(
        color: MyColors.C_FFCC80,
        iconName: MyImages.icon_house,
        cotegoryNAme: 'Home'),
    CotegoryToDo(
        color: MyColors.C_80FFA3,
        iconName: MyImages.icon_health,
        cotegoryNAme: 'Health'),
    CotegoryToDo(
        color: MyColors.C_80D1FF,
        iconName: MyImages.icon_movie,
        cotegoryNAme: 'Movie'),
  ];
}
