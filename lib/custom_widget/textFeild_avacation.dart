import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kader_new_flutter_app/utlies/app_colors.dart';

class textFeild_avacation extends StatelessWidget {

  final String hint;
  textFeild_avacation({this.hint});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: 30,
          end: 30
      ),
      child: TextField(
        cursorColor: AppColors.MAIN_COLOR,

        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w500,
          color: AppColors.HINT_TEXTFEILD_COLOR,
        ),
        decoration: InputDecoration(

          focusedBorder:OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.MAIN_COLOR, width: 2.0),
         ),
          hintText: hint,
          //AppLocalizations.of(context).translate('PleaseEnterTheVacationPeriodInNumbers'),
          hintStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'Tajawal',
            color: AppColors.HINT_TEXTFEILD_COLOR,
            fontWeight: FontWeight.w500,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
