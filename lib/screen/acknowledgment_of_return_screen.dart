import 'package:flutter/material.dart';
import 'package:kader_new_flutter_app/utlies/app_colors.dart';

class AcknowledgmentOfReturnScreen extends StatefulWidget {
  static final routeName = "acknowledgmentOfReturnScreen";

  @override
  _AcknowledgmentOfReturnScreenState createState() =>
      _AcknowledgmentOfReturnScreenState();
}

class _AcknowledgmentOfReturnScreenState
    extends State<AcknowledgmentOfReturnScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
            child: Text("إقرار العودة",
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
            SizedBox(
              height: 10,
            ),
            Table(
              //border: TableBorder.all(color: Colors.black),
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
                          child: Text("الرقم",
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
                        child: Text("الاسم",
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
    );
  }

}
