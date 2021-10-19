import 'package:flutter/material.dart';
import 'package:kader_new_flutter_app/utlies/app_colors.dart';

class AppRowListView extends StatelessWidget {
  final String text;

  AppRowListView({
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(children: [
      Container(
        height: 57,
        padding: EdgeInsetsDirectional.only(
          start: 15,
        ),
        child: SizedBox(
            height: 19,
            width: 16,
            child: Image.asset("images/polygon_1.png"),
    ),
      ),
      SizedBox(
        width: 11,
      ),
      Center(
        child: Text(text, style: TextStyle(
          fontSize: 14,
          color: AppColors.TEXT_LIST_COLOR,
          fontWeight: FontWeight.w600,
        ),),
      )
    ]
      ),
    );
  }
}