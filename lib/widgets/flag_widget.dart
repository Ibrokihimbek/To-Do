import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note/utils/colors.dart';
import 'package:note/utils/images.dart';
import 'package:note/widgets/text_style_widget.dart';

int nimadir = -1;
bool isOn = false;
String propirty = "";

class ButtonFlag extends StatelessWidget {
  const ButtonFlag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (context, state) {
                  return SizedBox(
                    width: 350,
                    height: 350,
                    child: AlertDialog(
                      backgroundColor: MyColors.C_363636,
                      title: Column(
                        children: [
                          Text(
                            "Task priority",
                            style: FontLatoW700().copyWith(fontSize: 16.sp),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          const Divider(
                            thickness: 2,
                            color: MyColors.C_AFAFAF,
                          )
                        ],
                      ),
                      content: Stack(
                        children: [
                          SizedBox(
                            width: 360,
                            height: 270,
                            child: GridView.builder(
                                itemCount: 10,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                ),
                                itemBuilder: (BuildContext contex, int index) {
                                  return InkWell(
                                    onTap: () {
                                      state(() {
                                        nimadir = index;
                                        propirty = (index + 1).toString();
                                        isOn = !isOn;
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(4).r,
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: nimadir == index
                                              ? const Color(0xff8875ff)
                                              : const Color(0xff272727)),
                                      child: Column(
                                        children: [
                                          Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 6),
                                              child: SvgPicture.asset(
                                                  MyImages.icon_flag)),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          Text(
                                            "${index + 1}",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Positioned(
                            bottom: 4,
                            right: 10,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: Container(
                                    width: 123,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.transparent),
                                    child: const Center(
                                        child: TextButton(
                                            onPressed: null,
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: Color(0xff8577ff),
                                                  fontSize: 16),
                                            ))),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                InkWell(
                                  child: Container(
                                    width: 123,
                                    height: 48,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: MyColors.C_8875FF),
                                    child: const Center(
                                      child: Text(
                                        "Save",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        child: SvgPicture.asset(MyImages.icon_flag));
  }
}
