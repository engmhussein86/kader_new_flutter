import 'package:flutter/material.dart';
import 'package:kader_new_flutter_app/utlies/app_colors.dart';

class AppBarScreen extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  AppBarScreen({this.text});
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.MAIN_COLOR,
      shadowColor: Color(0XFF4d0000),
      leading: IconButton(icon: Icon(Icons.more_vert),
          onPressed: () {}
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
      title: Center(
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
