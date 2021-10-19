import 'package:flutter/material.dart';
import 'package:kader_new_flutter_app/custom_widget/textFeild_avacation.dart';
import 'package:kader_new_flutter_app/utlies/app_colors.dart';

class AvacationRequestScreen extends StatefulWidget {
  static final routeName = "avacationRequestScreen";

  @override
  _AvacationRequestScreenState createState() => _AvacationRequestScreenState();
}

class _AvacationRequestScreenState extends State<AvacationRequestScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool is_checked_friday = false;
  bool is_checked_saturday = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        drawerEnableOpenDragGesture: true,
        appBar: AppBar(
          backgroundColor: AppColors.MAIN_COLOR,
          elevation: 0,
          title: Center(
              child: Text("طلب إجازة",
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
        body: Column(
          children: [
            Container(
              padding: EdgeInsetsDirectional.only(
                start: 16,
                end: 16,
                top: 18,
                // bottom: SizeConfig.scaleHeight(10),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(children: [
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Text("الاسم:  ",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: AppColors.MAIN_COLOR),
                        ),
                        Text(
                          "مريم جمال محمد حسين",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 25,
                              color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 270,
                  child: Column(
                    children: [
                      Text("طلب إجازة",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.grey.shade900),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textFeild_avacation(
                        hint:'الرجاء إدخال مدة الإجازة بالأرقام',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              checkColor: Colors.white,
                              // color of tick Mark
                              activeColor: AppColors.MAIN_COLOR,
                              title: Text("احتساب الجمعة",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.grey.shade900),
                              ),
                              value: is_checked_friday,
                              onChanged: (newValue) {
                                setState(() {
                                  is_checked_friday = !is_checked_friday;
                                });
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              checkColor: Colors.white,
                              // color of tick Mark
                              activeColor: AppColors.MAIN_COLOR,
                              title: Text("احتساب السبت",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.grey.shade900),
                              ),
                              value: is_checked_saturday,
                              onChanged: (newValue) {
                                setState(() {
                                  is_checked_saturday = !is_checked_saturday;
                                });
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textFeild_avacation(
                        hint: 'تاريخ بداية الإجازة',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      textFeild_avacation(
                        hint: 'تاريخ العودة من الإجازة',
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 40,
                        width: 100,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "إضافة",
                            //AppLocalizations.of(context).translate('Add')
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white),
                          ),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.MAIN_COLOR),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(
                                          color: AppColors.MAIN_COLOR)))),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

}
