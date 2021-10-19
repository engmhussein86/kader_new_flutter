import 'package:flutter/material.dart';

class AppStackHome extends StatelessWidget {
  final Image image;
  final String text;
  final Color color;
  final Function changeScreen;

  AppStackHome({
    this.image,
    this.text,
    this.color,
    this.changeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeScreen,
      child: Stack(
        children: [
          Container(
            width: 120,
            height: 95,
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                top: 25,
              ),
              child: SizedBox(
                  width: 26,
                  height: 26,
                  child: image),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.topCenter,
          ),
          PositionedDirectional(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(16),
                  bottomStart: Radius.circular(16),
                ),
                color: color,
              ),
              height: 25,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              alignment: AlignmentDirectional.center,
            ),
            bottom: 0,
            start: 0,
            end: 0,
          ),
        ],
      ),
    );
  }
}
