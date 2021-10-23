import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:kader_new_flutter_app/models/SSO_Info.dart';
import 'package:kader_new_flutter_app/models/SSO_Token.dart';
import 'package:kader_new_flutter_app/screen/home_screen.dart';
import 'package:kader_new_flutter_app/utlies/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewLogin extends StatefulWidget {
  static final routeName = "webviewlogin";

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<WebViewLogin> {
  final GlobalKey webViewKey = GlobalKey();
  Dio dio = Dio();
  InAppWebViewController webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  PullToRefreshController pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();
  String client_id = "KADER_APP_MOH";
  String client_secret = "_432f10daa373752fc6241adfe952fb8acb5235abcf";

  String _fcm_token;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("تسجيل الدخول الموحد SSO")),
        backgroundColor: AppColors.MAIN_COLOR,
      ),
      body: InAppWebView(
        key: webViewKey,
        initialUrlRequest: URLRequest(
            url: Uri.parse(
          'https://ssoidp.gov.ps/sso/module.php/sspoauth2/mobile_authorize.php?client_id=KADER_APP_MOH',
        )),
        initialOptions: options,
        pullToRefreshController: pullToRefreshController,
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onLoadStart: (controller, url) {
          setState(() {
            this.url = url.toString();

            List<String> split = this.url.split("code=");
            print("token: " + split[1]);
            generate_token(split[1]);
            urlController.text = this.url;
          });
        },
        androidOnPermissionRequest: (controller, origin, resources) async {
          return PermissionRequestResponse(
              resources: resources,
              action: PermissionRequestResponseAction.GRANT);
        },
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          var uri = navigationAction.request.url;

          if (![
            "http",
            "https",
            "file",
            "chrome",
            "data",
            "javascript",
            "about"
          ].contains(uri.scheme)) {
            if (await canLaunch(url)) {
              // Launch the App
              await launch(
                url,
              );
              // and cancel the request
              return NavigationActionPolicy.CANCEL;
            }
          }

          return NavigationActionPolicy.ALLOW;
        },
        onLoadStop: (controller, url) async {
          pullToRefreshController.endRefreshing();
          setState(() {
            this.url = url.toString();
            urlController.text = this.url;
          });
        },
        onLoadError: (controller, url, code, message) {
          pullToRefreshController.endRefreshing();
        },
        onProgressChanged: (controller, progress) {
          if (progress == 100) {
            pullToRefreshController.endRefreshing();
          }
          setState(() {
            this.progress = progress / 100;
            urlController.text = this.url;
          });
        },
        onUpdateVisitedHistory: (controller, url, androidIsReload) {
          setState(() {
            this.url = url.toString();
            urlController.text = this.url;
          });
        },
        onConsoleMessage: (controller, consoleMessage) {
          print(consoleMessage);
        },
      ),
    );
  }

  ///////////////////////////////////////////
  void setFcmToken(String token) {
    print('FCM Token: $token');
    setState(() {
      _fcm_token = token;
    });

    prefs.setString("fcm_token", _fcm_token);
    insert_login(_fcm_token);
  }

  //////////////////////////////////////////////
  Future<void> insert_login(String token) async {
    const String ROOT = "https://apps.moh.gov.ps/kader/index.php/";
    const String AUTH_Login = ROOT + "UsersAPI/INSERT_USERS_AUTHENTICATION";

    https: //apps.moh.gov.ps/kader/index.php/UsersAPI/INSERT_USERS_AUTHENTICATION
    http: //apps.moh.gov.ps/kader/index.php/UsersAPI/INSERT_USERS_AUTHENTICATION
    print("hello" + AUTH_Login);
    final insert_response = await dio.post(
      AUTH_Login,
      options: Options(headers: <String, String>{
        'P-ID': prefs.getString('user_id') ?? '',
        'P-TOKEN': prefs.getString('token') ?? '',
        'FCM-TOKEN': _fcm_token,
      }),
      // body: //jsonEncode(
      // <String, String>{
      //   'code': code,
      //   'client_id': client_id,
      //   'client_secret': client_secret,
      // },//),
    );

    print("hello" + insert_response.data);
    //Navigator.pushReplacementNamed(context, '/home_screen');

    if (insert_response.statusCode == 200) {
      print(jsonDecode(insert_response.data)['LOGIN_RESULT']);
      if (jsonDecode(insert_response.data)['LOGIN_RESULT'] == '1') {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("حدث خطأ .."),
        ));
      }

      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      // SSO_Token sso_token = SSO_Token.fromJson(jsonDecode(response.body));
      // UserPreferences.instance.saveToken(sso_token.accessToken);
      // print(sso_token.accessToken);
    }
  }

  ///////////////////////////////////////////
  ///////////////////////////////////////////
  Future<void> generate_token(String code) async {
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text("Sending Message"),
    // ));

    prefs = await SharedPreferences.getInstance();

    showLoaderDialog(context);
    print("code: " + code);
    FormData data = FormData.fromMap({
      'code': code,
      'client_id': client_id,
      'client_secret': client_secret,
    });
    final response = await dio.post(
      'https://ssoidp.gov.ps/sso/module.php/sspoauth2/token.php',
      data: data,
    );

    print("generate token: " + response.data.toString());

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      SSO_Token sso_token = SSO_Token.fromJson(response.data);
      prefs.setString('token', sso_token.accessToken);
      // UserPreferences.instance.saveToken(sso_token.accessToken);
      print("accessToken: " + sso_token.accessToken);

      dio.options.headers['x-sso-authorization'] = sso_token.accessToken;

      final verify_response = await dio
          .post('https://ssoidp.gov.ps/sso/module.php/sspoauth2/verify.php',
              // options: Options(headers: <String, String>{
              //   'x-sso-authorization': sso_token.accessToken,
              // }),
              data: {});

      print("verify response" + verify_response.data.toString());

      if (verify_response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        SSO_Info sso_info = SSO_Info.fromJson(verify_response.data);
        print("Status verify: " + sso_info.status);

        if (sso_info.status == "success") {
          prefs.setBool("isLogged", true);
          prefs.setString("user_id", sso_info.userId);
          prefs.setString("account_type", sso_info.accountType);
          prefs.setString("name", sso_info.name);
          prefs.setString("mobile", sso_info.mobile);
          prefs.setString("ministry_cd", sso_info.ministryCd == null ? "": sso_info.ministryCd);
          prefs.setString("sso_info", verify_response.data.toString());

          prefs.setString("accessToken", sso_token.accessToken);

          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);

          ///for firebase push notificaton
          // FirebaseMessaging.instance.getToken().then(setFcmToken);
          // Stream<String> _tokenStream =
          //     FirebaseMessaging.instance.onTokenRefresh;
          // _tokenStream.listen(setFcmToken);

          // print(prefs.getString('fcm_token') ?? '');
          // print(prefs.getString('ministry_cd') ?? '');

        }
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw Exception('Failed to verify');
      }
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to login');
    }
  }

///////////////////////////////////////////
  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7, right: 7),
              child: Text("جاري تسجيل الدخول ..")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
