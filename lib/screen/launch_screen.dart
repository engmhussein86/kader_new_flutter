import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kader_new_flutter_app/screen/home_screen.dart';
import 'package:kader_new_flutter_app/screen/webview_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LaunchScreen extends StatefulWidget {
  static final routeName = "launchpage";

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}
class _LaunchScreenState extends State<LaunchScreen> {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String> _token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoggedIn();
    Future.delayed(Duration(seconds: 3), () {
        // Navigator.pushReplacementNamed(context, LoginWebViewScreen.routeName);
      Navigator.pushReplacementNamed(context, WebViewLogin.routeName);

    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/launch.png"), fit: BoxFit.cover),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 164,
                  height: 176,
                  child: Image(image: AssetImage('images/logo.png'),),
                ),
              ),
              SizedBox(
                height: 33,
              ),
              Container(
               // width: SizeConfig.scaleWidth(164),
                //height: SizeConfig.scaleHeight(52),
                child:  Text(
                  "موظقي وزارة الصحة الفلسطينية",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),

              ),
              ),
            ]),
      ),

    );
  }
  void isLoggedIn() async{
    final SharedPreferences prefs = await _prefs;
    String token = prefs.getString('token');
    if(token != null){
      Future.delayed(Duration(seconds: 3), () {

        // Navigator.pushReplacementNamed(context, LoginWebViewScreen.routeName);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);

      });
    }else{
      Future.delayed(Duration(seconds: 3), () {

        // Navigator.pushReplacementNamed(context, LoginWebViewScreen.routeName);
        Navigator.pushReplacementNamed(context, WebViewLogin.routeName);

      });
    }

  }
}
