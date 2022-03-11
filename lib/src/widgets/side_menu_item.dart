import 'package:capitan_flutter_web/src/bloc/calculator_bloc.dart';
import 'package:capitan_flutter_web/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    Key? key,
    required ControllerCalculo controller,
    required this.heightExpanded,
    required this.expanded,
    required this.position,
    required this.title,
    required this.aseetUrl,
    required this.content,
  })  : _controller = controller,
        super(key: key);

  final ControllerCalculo _controller;
  final double heightExpanded;
  final bool expanded;
  final int position;
  final String title;
  final String aseetUrl;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: (expanded) ? heightExpanded : ScreenUtil().setHeight(55),
      duration: const Duration(milliseconds: 300),
      child: SizedBox(
        child: Stack(
          children: [
            (expanded)
                ? Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(5),
                      horizontal: ScreenUtil().setWidth(5),
                    ),
                    margin: EdgeInsets.only(
                      left: ScreenUtil().setWidth(30),
                      right: ScreenUtil().setWidth(30),
                      top: ScreenUtil().setHeight(60),
                    ),
                    decoration: BoxDecoration(
                      color: expanded ? kcolorContainerSubitems : ktransparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: content)
                : Container(),
            InkWell(
              hoverColor: Colors.transparent,
              onTap: () {
                _controller.changeExpanded(!expanded, position);
              },
              child: Container(
                height: ScreenUtil().setHeight(55),
                padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(5),
                  horizontal: ScreenUtil().setWidth(5),
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(30),
                ),
                decoration: BoxDecoration(
                  color: expanded ? kcolorContainerSelected : ktransparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: ScreenUtil().setHeight(35),
                      width: ScreenUtil().setHeight(35),
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setHeight(5),
                      ),
                      decoration: const BoxDecoration(),
                      child: SvgPicture.asset(
                        aseetUrl,
                        color: expanded ? kcolorSelectedItem : kcolorUnSelectedItem,
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.bold,
                        color: expanded ? kcolorSelectedItem : kcolorUnSelectedItem,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: expanded ? kcolorSelectedItem : kcolorUnSelectedItem,
                      size: ScreenUtil().setHeight(20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
