import 'dart:collection';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:image_slider/image_slider.dart';
import 'package:kader_new_flutter_app/custom_widget/app_drawer.dart';
import 'package:kader_new_flutter_app/custom_widget/app_stack_home.dart';
import 'package:kader_new_flutter_app/models/all_news_response.dart';
import 'package:kader_new_flutter_app/providers/home_provider.dart';
import 'package:kader_new_flutter_app/screen/administrative_services_screen.dart';
import 'package:kader_new_flutter_app/screen/custody_screen.dart';
import 'package:kader_new_flutter_app/screen/details_of_the_news_screen.dart';
import 'package:kader_new_flutter_app/screen/news_screen.dart';
import 'package:kader_new_flutter_app/utlies/app_colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static final routeName = "homepage";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Center(child: Text("Home".tr())),
        backgroundColor: AppColors.MAIN_COLOR,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            openEndDrawer();

          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
            },
          ),
        ],
      ),
      drawer: DrawerScreen(),
      body: Consumer<HomeProvider>(builder: (context, provider, x) {
        List<AllNewsResponse> allLastNews = provider.allLastNews;
        return Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              allLastNews == null
                  ? Container(
                height: 215,

                child: Center(
                        child: CircularProgressIndicator(),
                      ),
                  )

                  // Container(
                  //   height: 215,
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadiusDirectional.only(
                  //       bottomEnd: Radius.circular(16),
                  //       bottomStart: Radius.circular(16),
                  //     ),
                  //   ),
                  //
                  : ImageSlider(
                      /// Shows the tab indicating circles at the bottom
                      showTabIndicator: true,

                      /// Cutomize tab's colors
                      tabIndicatorColor: Colors.white,

                      /// Customize selected tab's colors
                      tabIndicatorSelectedColor: AppColors.MAIN_COLOR,

                      /// Height of the indicators from the bottom
                      // tabIndicatorHeight: 16,
                      tabIndicatorHeight: 40,

                      /// Size of the tab indicator circles
                      tabIndicatorSize: 10,

                      /// tabController for walkthrough or other implementations
                      tabController: tabController,

                      /// Animation curves of sliding
                      curve: Curves.fastOutSlowIn,

                      /// Width of the slider
                      width: MediaQuery.of(context).size.width,

                      /// Height of the slider
                      height: 215,

                      /// If automatic sliding is required
                      autoSlide: true,

                      /// Time for automatic sliding
                      duration: new Duration(seconds: 6),

                      /// If manual sliding is required
                      allowManualSlide: true,

                      /// Children in slideView to slide
                      children: allLastNews.map((element) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsNewsScreen(element),
                                ));
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    // bottomLeft: Radius.circular(16),
                                    //bottomRight: Radius.circular(16),
                                    ),
                                child: Image.network(
                                  element.imageUrl,
                                  height: 215,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              PositionedDirectional(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadiusDirectional.only(
                                        // bottomEnd: Radius.circular(16),
                                        // bottomStart: Radius.circular(16),
                                        ),
                                    color:
                                        AppColors.MAIN_COLOR.withOpacity(0.78),
                                  ),
                                  height: 40,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.only(
                                      top: 5,
                                      start: 19,
                                      end: 25,
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              element.postTitle,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 10,

                                              ),
                                              textAlign: TextAlign.right,

                                            ),
                                          ),
                                        )
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                    ),
                                  ),
                                  alignment: AlignmentDirectional.center,
                                ),
                                bottom: 0,
                                start: 0,
                                end: 0,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
              SizedBox(
                height: 16,
              ),
              GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 21,
                ),
                children: [
                  AppStackHome(
                    // changeScreen: () => HomeBaseScreen.changeBaseWidget(
                    //     context, NewsScreen(), "News"),
                    changeScreen: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsScreen(),
                        )
                     ),
                    image: Image.asset(
                      'images/group_225.png',
                      color: AppColors.SHADOW_CONTAINER_COLOR,
                    ),
                    text: "الأخبار",
                    color: AppColors.SHADOW_CONTAINER_COLOR,
                  ),
                  AppStackHome(
                    changeScreen: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustodyScreen(),
                        )
                    ),
                    image: Image.asset(
                      'images/path_194.png',
                      color: AppColors.SHADOW_CONTAINER_COLOR,
                    ),
                    text: "العهدة",
                    color: AppColors.SHADOW_CONTAINER_COLOR,
                  ),
                  AppStackHome(
                    changeScreen: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdministrativeServicesScreen(),
                        )
                    ),
                    image: Image.asset(
                      'images/group_232.png',
                      color: AppColors.SHADOW_CONTAINER_COLOR,
                    ),
                    text: "الخدمات الإدارية",
                    color: AppColors.SHADOW_CONTAINER_COLOR,
                  ),
                  AppStackHome(
                    image: Image.asset(
                      'images/group_235.png',
                      color: AppColors.SHADOW_CONTAINER_COLOR,
                    ),
                    text: "الدوام",
                    color: AppColors.SHADOW_CONTAINER_COLOR,
                  ),
                  AppStackHome(
                    image: Image.asset(
                      'images/noun_time_3182552.png',
                      color: AppColors.SHADOW_CONTAINER_COLOR,
                    ),
                    text: "الورديات",
                    color: AppColors.SHADOW_CONTAINER_COLOR,
                  ),
                  AppStackHome(
                    image: Image.asset(
                      'images/group_225.png',
                      color: AppColors.SHADOW_CONTAINER_COLOR,
                    ),
                    text: "بروتوكولات",
                    color: AppColors.SHADOW_CONTAINER_COLOR,
                  ),
                  AppStackHome(
                    image: Image.asset(
                      'images/noun_more_1751209.png',
                      color: AppColors.HINT_TEXT_STACK_HOME_COLOR,
                    ),
                    text: "الخدمات الإضافية",
                    color: AppColors.HINT_TEXT_STACK_HOME_COLOR,
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  void openEndDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }
}
