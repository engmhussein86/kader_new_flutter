import 'package:flutter/material.dart';
import 'package:kader_new_flutter_app/utlies/app_colors.dart';

class PermanencsScreen extends StatefulWidget {
  static final routeName = "permanencsScreen";

  @override
  _PermanencsScreenState createState() => _PermanencsScreenState();
}

class _PermanencsScreenState extends State<PermanencsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FocusNode focusNode = FocusNode();
  String hintText = '';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        hintText = '';
      } else {
        hintText = '';
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
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
              child: Text("الدوام",
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
          child: Column(
            children: [
              Row(
                children: [
                  Text("الاسم:  ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: AppColors.MAIN_COLOR),
                  ),
                  Expanded(
                    child: Text(
                      "مريم جمال محمد حسين",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color: Colors.grey.shade700),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("الرقم الوظيفي: ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: AppColors.MAIN_COLOR),
                  ),
                  Expanded(
                    child: Text(
                      "123456",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.grey.shade700),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text("الدوام",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.grey.shade900),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("الشهر",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: AppColors.MAIN_COLOR),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: TextField(
                      cursorColor: AppColors.MAIN_COLOR,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.MAIN_COLOR, width: 2.0),
                        ),
                        hintText: "12",

                        //AppLocalizations.of(context).translate('PleaseEnterTheVacationPeriodInNumbers'),
                        hintStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Tajawal',
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("السنة",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                        color: AppColors.MAIN_COLOR),
                  ),
                  SizedBox(width: 10,),

                  Expanded(
                    child: TextField(

                      cursorColor: AppColors.MAIN_COLOR,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700,
                      ),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: AppColors.MAIN_COLOR, width: 2.0),
                        ),
                        hintText: "2021",

                        //AppLocalizations.of(context).translate('PleaseEnterTheVacationPeriodInNumbers'),
                        hintStyle: TextStyle(
                          fontSize:16,
                          fontFamily: 'Tajawal',
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),

                  Icon(
                    Icons.search,
                    color: AppColors.MAIN_COLOR,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Table(
                //border: TableBorder.all(color: Colors.black),
                border: TableBorder.all(color: Colors.black),

                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: AppColors.MAIN_COLOR,
                    ),
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                        child: TableCell(
                          child: Center(
                            child: Text("التاريخ",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Tajawal',
                                  color: Colors.white),
                            ),
                          ),
                          verticalAlignment: TableCellVerticalAlignment.middle,
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text("اليوم",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Tajawal',
                                color: Colors.white),
                          ),
                        ),
                        verticalAlignment: TableCellVerticalAlignment.middle,
                      ),
                      TableCell(
                        child: Center(
                          child: Text("الحضور",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Tajawal',
                                color: Colors.white),
                          ),
                        ),
                        verticalAlignment: TableCellVerticalAlignment.middle,
                      ),
                      TableCell(
                        child: Center(
                          child: Text("الانصراف",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Tajawal',
                                color: Colors.white),
                          ),
                        ),
                        verticalAlignment: TableCellVerticalAlignment.middle,
                      ),
                      TableCell(
                        child: Center(
                          child: Text("تاريخ الحضور",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Tajawal',
                                color: Colors.white),
                          ),
                        ),
                        verticalAlignment: TableCellVerticalAlignment.middle,
                      ),
                      TableCell(
                        child: Center(
                          child: Text("حالة الدوام",
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Tajawal',
                                color: Colors.white),
                          ),
                        ),
                        verticalAlignment: TableCellVerticalAlignment.middle,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
