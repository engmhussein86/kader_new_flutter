import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:kader_new_flutter_app/screen/webview_page.dart';
import 'package:kader_new_flutter_app/utlies/app_colors.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  var _lang = ['العربية', 'English'];
  var _currentItemSelected = 'English';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
             child: Column(

               mainAxisAlignment: MainAxisAlignment.center,
               children: [

                 Center(
                   child: Container(
                     width: 90,
                     height: 90,
                     color: AppColors.MAIN_COLOR,
                     child: Image(image: AssetImage('images/logo.png'),

                       // radius: SizeConfig.scaleHeight(48),
                     ),
                   ),
                 ),
                 SizedBox(
                   width: 20,
                 ),
                 Text(
                   "Kader".tr(),
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 10,
                     color: AppColors.MAIN_COLOR,
                   ),
                 ),
               ],
             ),

            decoration: BoxDecoration(
              color: AppColors.MAIN_COLOR,
            ),
          ),
          ExpansionTile(
              leading: Icon(
                Icons.language,
                color: Colors.black,
              ),
              title: Text("Language".tr(),style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              children: [
                GestureDetector(
                  child: Text(
                    "Arabic".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                      context.setLocale(Locale('ar'));
                      Navigator.pop(context);
                  },
                ),
                GestureDetector(
                  child: Text("English".tr(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    context.setLocale(Locale('en'));
                    Navigator.pop(context);
                  },
                ),
              ]),
          ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(context, WebViewLogin.routeName);
            },
            leading: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            title: Text("Logout".tr(),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ),
        ],
      ),

    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}
