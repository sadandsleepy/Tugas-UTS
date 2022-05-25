import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class DialButton extends StatelessWidget {
  const DialButton({
    Key? key,
    required this.iconSrc,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String iconSrc, text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      width: 120,
      child: TextButton(
        onPressed: press,
        child: Column(
          children: [
            SvgPicture.asset(
              iconSrc,
              color: Colors.black12,
              height: 36,
            ),
            SizedBox(height: 2.h,),
            Text(
              text,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 10.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}

BoxDecoration backgroundDecoration(int color){
  return BoxDecoration(
      color: Color(color),
      borderRadius: BorderRadius.circular(10)
  );
}

void launchURL(url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}