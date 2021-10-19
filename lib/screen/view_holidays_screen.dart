import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kader_new_flutter_app/utlies/app_colors.dart';

class ViewHolidaysScreen extends StatefulWidget {
  static final routeName = "viewHolidaysScreen";

  @override
  _ViewHolidaysScreenState createState() => _ViewHolidaysScreenState();
}

class _ViewHolidaysScreenState extends State<ViewHolidaysScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var startDateController = TextEditingController();
  var endDateController = TextEditingController();
  var _selectedValue;

  DateTime _dateTime = DateTime.now();

  _selectedTodoDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (_pickedDate != null) {
      setState(() {
        print(DateFormat.yMd());
        _dateTime = _pickedDate;
        startDateController.text = DateFormat.YEAR_MONTH_DAY;
      });
    }
  }

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
        // key: _scaffoldKey,
        drawerEnableOpenDragGesture: true,
        appBar: AppBar(
          backgroundColor: AppColors.MAIN_COLOR,
          elevation: 0,
          title: Center(
            child: Text("عرض الإجازات",
            ),
          ),
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
            start: 8,
            end: 8,
            //top: SizeConfig.scaleHeight(18),
            // bottom: SizeConfig.scaleHeight(10),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Padding(padding: EdgeInsetsDirectional.all(10)),
                Container(
                  margin: EdgeInsetsDirectional.only(start: 18, end: 17),
                  child: Column(
                    children: [
                      Row(children: [
                        IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () {
                            _selectedTodoDate(context);
                            setState(() {});
                          },
                        ),
                        Expanded(
                          child: Column(children: [
                            Padding(
                                padding: EdgeInsetsDirectional.only(top: 15)),
                            Text(DateFormat.yMd().format(_dateTime)),
                            Divider(
                              color: AppColors.MAIN_COLOR,
                            ),
                          ]),
                        ),
                        // SizedBox(width: SizeConfig.scaleWidth(40),),
                        IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () {
                            _selectedTodoDate(context);
                            setState(() {});
                          },
                        ),
                        Expanded(
                          child: Column(children: [
                            Padding(
                                padding: EdgeInsetsDirectional.only(top: 15)),
                            Text(DateFormat.yMd().format(_dateTime)),
                            Divider(
                              color: AppColors.MAIN_COLOR,
                            ),
                          ]),
                        ),
                        Spacer(),
                        Icon(
                          Icons.search,
                          color: AppColors.MAIN_COLOR,
                        ),
                        // SizedBox(
                        //   width: SizeConfig.scaleWidth(16),
                        // ),
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              
                Table(
                  border: TableBorder.all(color: Colors.black),
                  //  columnWidths: const <int, TableColumnWidth>{
                  //    0: IntrinsicColumnWidth(),
                  //    1: FlexColumnWidth(),
                  //    2: FixedColumnWidth(64),
                  //  },
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
                              child: Text("نوع الإجازة",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Tajawal',
                                    color: Colors.white),
                              ),
                            ),
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text("المدة",
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
                            child: Text("البداية",
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
                            child: Text("النهاية",
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
                            child: Text("الحالة",
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
      ),
    );
  }

}
