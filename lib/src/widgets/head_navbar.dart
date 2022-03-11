import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeadNavbar extends StatelessWidget {
  const HeadNavbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: ScreenUtil().setHeight(25),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Capitán',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(40),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Encuentra la emoción',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(25),
              ),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(30),
              width: ScreenUtil().setHeight(30),
              child: const Center(
                child: Icon(
                  Icons.mail,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              width: ScreenUtil().setHeight(25),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(25),
              width: ScreenUtil().setHeight(25),
              child: SvgPicture.asset(
                'assets/svg/bell.svg',
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: ScreenUtil().setHeight(25),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(50),
              width: ScreenUtil().setHeight(50),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  'https://capitan.bufeotec.com/media/usuarios/669_26112021163212.jpg',
                  
                 /*  errorBuilder: (context, object, ff) {
                    return SizedBox(
                      child: Image.asset(
                        'assets/img/profile.png',
                        fit: BoxFit.cover,
                        width: ScreenUtil().setWidth(60),
                        height: ScreenUtil().setHeight(60),
                      ),
                    );
                  }, */
                ),
              ),
            ),
            SizedBox(
              width: ScreenUtil().setHeight(10),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Angelo Tapullima',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('SuperAdmin'),
              ],
            ),
            SizedBox(
              width: ScreenUtil().setHeight(35),
            ),
          ],
        ),
      ],
    );
  }
}
