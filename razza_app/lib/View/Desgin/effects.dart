import 'dart:async';

// import 'package:dropdown_banner/dropdown_banner.dart';
import 'package:achievement_view/achievement_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razza_app/View/Desgin/color.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Effects {
  Style style = Style();
  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  void _doSomething(RoundedLoadingButtonController controller) async {
    Timer(Duration(milliseconds: 2500), () {
      controller.success();
    });
  }

  loadingButton(Function function, ctx) {
    return RoundedLoadingButton(
      width: MediaQuery.of(ctx).size.width / 1.2,
      successIcon: Icons.done_rounded,
      color: style.primaryColor,
      successColor: Colors.green,
      child:
          Text('Add to Cart', style: GoogleFonts.poppins(color: Colors.white)),
      controller: _btnController1,
      onPressed: () {
        _doSomething(_btnController1);
        function();
      },
    );
  }

  showAchievementView(BuildContext context, title , content, backColor, icon) {
    AchievementView(context,
        title: "$title", subTitle: "$content",
        //onTab: _onTabAchievement,
        icon: Icon(icon, color: Colors.white,),
        //typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
        borderRadius: BorderRadius.circular(15),
        color: backColor == 1? Color.fromARGB(255, 87, 43, 133) : Color.fromARGB(255, 152, 108, 188),
        textStyleTitle: GoogleFonts.poppins(color: Colors.white),
        textStyleSubTitle: GoogleFonts.poppins(color: Colors.white),
        alignment: Alignment.topCenter,
        duration: Duration(seconds: 5),
        //isCircle: false,
        listener: (status) {
      print(status);
      //AchievementState.opening
      //AchievementState.open
      //AchievementState.closing
      //AchievementState.closed
    })
      ..show();
  }
}
