import 'package:flutter/material.dart';
import 'package:kader_new_flutter_app/models/all_news_response.dart';
import 'package:kader_new_flutter_app/utlies/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class DetailsNewsScreen extends StatefulWidget {
  DetailsNewsScreen(this.news);

  final AllNewsResponse news;
  @override
  _DetailsNewsScreenState createState() => _DetailsNewsScreenState();
}

class _DetailsNewsScreenState extends State<DetailsNewsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(icon: Icon(Icons.more_vert), onPressed: () {});
            },
          ),
          backgroundColor: AppColors.MAIN_COLOR,
          title: Center(
            child: Text("تفاصيل الأخبار"),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ]),
      body: widget.news == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.news.postTitle,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                widget.news.postDate,
                                style: TextStyle(
                                  color: AppColors.HINT_TEXT_STACK_HOME_COLOR,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.zero,
                            height: 215,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                                widget.news.imageUrl),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget.news.postContent,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                      GestureDetector(
                        onTap: () {
                          _launchURL();
                        },
                        child: Center(
                          child: Text(
                            "للانتقال لصفحة الموقع اضغط هنا",
                            style: TextStyle(
                              color: AppColors.MAIN_COLOR,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
    );
  }
}

_launchURL() async {
  const url = 'https://www.moh.gov.ps/portal/category/it-unit/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
