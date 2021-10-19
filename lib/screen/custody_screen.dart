import 'package:flutter/material.dart';
import 'package:kader_new_flutter_app/custom_widget/app_bar_screen.dart';
import 'package:kader_new_flutter_app/utlies/app_colors.dart';


class CustodyScreen extends StatefulWidget {
  static final routeName = "custodyScreen";

  @override
  _CustodyScreenState createState() => _CustodyScreenState();
}

class _CustodyScreenState extends State<CustodyScreen> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("العهدة")),
        backgroundColor: AppColors.MAIN_COLOR,
        leading: IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsetsDirectional.only(
          start: 16,
          end: 16,
          top: 18,
          // bottom: SizeConfig.scaleHeight(10),
        ),
        decoration: BoxDecoration(
          color: AppColors.DOTS_HORIZANTAL_COLOR,
        ),

      ),
    );
  }
}
