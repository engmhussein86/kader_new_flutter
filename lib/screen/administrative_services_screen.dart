import 'package:flutter/material.dart';
import 'package:kader_new_flutter_app/custom_widget/app_drawer.dart';
import 'package:kader_new_flutter_app/custom_widget/app_stack_home.dart';
import 'package:kader_new_flutter_app/screen/electronic_leave_screen.dart';
import 'package:kader_new_flutter_app/screen/permanence_screen.dart';
import 'package:kader_new_flutter_app/screen/shifts_screen.dart';
import 'package:kader_new_flutter_app/utlies/app_colors.dart';

class AdministrativeServicesScreen extends StatefulWidget {
  static final routeName = "administrativeServicesScreen";

  @override
  _AdministrativeServicesScreenState createState() =>
      _AdministrativeServicesScreenState();
}

class _AdministrativeServicesScreenState
    extends State<AdministrativeServicesScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        title: Center(child: Text("الخدمات الإدارية")),
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
        child: Column(
          children: [
            GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 21,
                ),
                children: [
                  AppStackHome(
                    changeScreen: () => Navigator.pushNamed(
                        context, ElectronicLeaveScreen.routeName),
                    image: Image.asset(
                      'images/group_232.png',
                      color: AppColors.SHADOW_CONTAINER_COLOR,
                    ),
                    text: "الإجازة الالكترونية",
                    color: AppColors.SHADOW_CONTAINER_COLOR,
                  ),
                  AppStackHome(
                    changeScreen: () =>
                        Navigator.pushNamed(context, PermanencsScreen.routeName),
                    image: Image.asset(
                      'images/path_194.png',
                      color: AppColors.SHADOW_CONTAINER_COLOR,
                    ),
                    text: "الدوام",
                    color: AppColors.SHADOW_CONTAINER_COLOR,
                  ),
                  AppStackHome(
                    changeScreen: () =>
                        Navigator.pushNamed(context, ShiftsScreen.routeName),

                    //   HomeBaseScreen.changeBaseWidget(context, ShiftsScreen(), "Shifts"),
                    image: Image.asset(
                      'images/group_232.png',
                      color: AppColors.SHADOW_CONTAINER_COLOR,
                    ),
                    text: "الورديات",
                    color: AppColors.SHADOW_CONTAINER_COLOR,
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
