import 'package:flutter/material.dart';
import 'package:kader_new_flutter_app/utlies/app_colors.dart';

class ShiftsScreen extends StatefulWidget {
  static final routeName = "shiftsScreen";

  @override
  _ShiftsScreenState createState() => _ShiftsScreenState();
}

class _ShiftsScreenState extends State<ShiftsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        backgroundColor: AppColors.MAIN_COLOR,
        elevation: 0,
        title: Center(
            child: Text("الورديات",
            )),
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
