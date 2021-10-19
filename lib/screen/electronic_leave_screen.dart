import 'package:flutter/material.dart';
import 'package:kader_new_flutter_app/custom_widget/app_row_list_view.dart';
import 'package:kader_new_flutter_app/screen/acknowledgment_of_return_screen.dart';
import 'package:kader_new_flutter_app/screen/avacation_request_screen.dart';
import 'package:kader_new_flutter_app/screen/pending_requests_screen.dart';
import 'package:kader_new_flutter_app/screen/view_holidays_screen.dart';
import 'package:kader_new_flutter_app/utlies/app_colors.dart';


class ElectronicLeaveScreen extends StatefulWidget {
  static final routeName = "electronicLeaveScreen";

  @override
  _ElectronicLeaveScreenState createState() => _ElectronicLeaveScreenState();
}

class _ElectronicLeaveScreenState extends State<ElectronicLeaveScreen> {
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
        backgroundColor: AppColors.MAIN_COLOR,
        elevation: 0,
        title: Text("الإجازة الالكترونية",
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
          start: 16,
          end: 16,
          top: 18,
          // bottom: SizeConfig.scaleHeight(10),
        ),
        decoration: BoxDecoration(
          color: AppColors.DOTS_HORIZANTAL_COLOR,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ListView(
            shrinkWrap: true,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AvacationRequestScreen.routeName);
                },
                child: AppRowListView(
                  text: "التقدم لطلب إجازة",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PendingRequestsScreen.routeName);
                },
                child: AppRowListView(
                  text:"طلبات في الانتظار",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, AcknowledgmentOfReturnScreen.routeName);
                },
                child: AppRowListView(
                  text: "إقرار العودة",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ViewHolidaysScreen.routeName);
                },
                child: AppRowListView(
                  text:"عرض الإجازات",
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
