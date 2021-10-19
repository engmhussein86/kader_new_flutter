
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:kader_new_flutter_app/providers/home_provider.dart';
import 'package:kader_new_flutter_app/providers/news_provider.dart';
import 'package:kader_new_flutter_app/route_helper.dart';
import 'package:kader_new_flutter_app/screen/acknowledgment_of_return_screen.dart';
import 'package:kader_new_flutter_app/screen/administrative_services_screen.dart';
import 'package:kader_new_flutter_app/screen/avacation_request_screen.dart';
import 'package:kader_new_flutter_app/screen/custody_screen.dart';
import 'package:kader_new_flutter_app/screen/electronic_leave_screen.dart';
import 'package:kader_new_flutter_app/screen/home_screen.dart';
import 'package:kader_new_flutter_app/screen/launch_screen.dart';
import 'package:kader_new_flutter_app/screen/news_screen.dart';
import 'package:kader_new_flutter_app/screen/pending_requests_screen.dart';
import 'package:kader_new_flutter_app/screen/permanence_screen.dart';
import 'package:kader_new_flutter_app/screen/shifts_screen.dart';
import 'package:kader_new_flutter_app/screen/view_holidays_screen.dart';
import 'package:kader_new_flutter_app/screen/webview_page.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  await EasyLocalization.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<NewsProvider>(
          create: (context) => NewsProvider(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path:
        'translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        child: MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      navigatorKey: RouteHelper.routeHelper.navKey,
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget),
        maxWidth: 1200,
        minWidth: 400,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(400, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      routes: {
        LaunchScreen.routeName: (context) => LaunchScreen(),
        WebViewLogin.routeName: (context) => WebViewLogin(),
        HomeScreen.routeName: (context) => HomeScreen(),
        NewsScreen.routeName: (context) => NewsScreen(),
        CustodyScreen.routeName: (context) => CustodyScreen(),
        AdministrativeServicesScreen.routeName: (context) => AdministrativeServicesScreen(),
        PermanencsScreen.routeName: (context) => PermanencsScreen(),
        ShiftsScreen.routeName: (context) => ShiftsScreen(),
        ElectronicLeaveScreen.routeName: (context) => ElectronicLeaveScreen(),
        AvacationRequestScreen.routeName: (context) => AvacationRequestScreen(),
        PendingRequestsScreen.routeName: (context) => PendingRequestsScreen(),
        ViewHolidaysScreen.routeName: (context) => ViewHolidaysScreen(),
        AcknowledgmentOfReturnScreen.routeName: (context) => AcknowledgmentOfReturnScreen(),
      },
      home: LaunchScreen(),
    );
  }
}

