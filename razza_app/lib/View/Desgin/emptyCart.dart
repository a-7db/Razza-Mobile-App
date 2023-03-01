import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';



class EmptyScreen extends StatelessWidget {
  EmptyScreen({Key? key,}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
        alignment: Alignment.center,
        child: EmptyWidget(
          image: null,
          packageImage: PackageImage.Image_1,
          title: 'No Notification',
          subTitle: 'No  notification available yet',
          titleTextStyle: TextStyle(
            fontSize: 22,
            color: Color(0xff9da9c7),
            fontWeight: FontWeight.w500,
          ),
          subtitleTextStyle: TextStyle(
            fontSize: 14,
            color: Color(0xffabb8d6),
          ),
        ),
      );
  }
}
