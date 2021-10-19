import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kader_new_flutter_app/models/all_news_response.dart';
import 'package:kader_new_flutter_app/providers/news_provider.dart';
import 'package:kader_new_flutter_app/screen/details_of_the_news_screen.dart';
import 'package:kader_new_flutter_app/utlies/app_colors.dart';
import 'package:lazy_loading_list/lazy_loading_list.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class NewsScreen extends StatefulWidget {
  static final routeName = "newspage";

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  var _controller = TextEditingController();
  // final List<AllNewsResponse> news;
  // _NewsScreenState(this.news);
  //
  // @override
  // void initState(){
  // super.initState();
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("الأخبار")),
        backgroundColor: AppColors.MAIN_COLOR,
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
      body: Consumer<NewsProvider>(builder: (context, provider, x) {
        // List<AllNewsResponse> allNews = provider.allNews;
        if (provider.allNews == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            padding: EdgeInsetsDirectional.only(
              start: 16,
              end: 16,
              top: 18,
            ),
            decoration: BoxDecoration(
              color: AppColors.DOTS_HORIZANTAL_COLOR,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsetsDirectional.only(
                  start: 5,
                  end: 5,
                ),
                height: 40,
                child: TextField(
                  controller: _controller,
                  onChanged: (text) {
                  provider.getSearchNews(text);
                  },
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Tajawal',
                    fontWeight: FontWeight.w500,
                    color: AppColors.HINT_TEXTFEILD_COLOR,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    contentPadding: EdgeInsetsDirectional.only(
                      start: 20,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                      },
                      icon: Icon(Icons.search),
                      color: Colors.black,
                    ),
                    hintText: 'بحث',
                    // prefixText: ' ',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Tajawal',
                      color: AppColors.HINT_TEXTFEILD_COLOR,
                      fontWeight: FontWeight.w500,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26),
                      borderSide: BorderSide(
                        color: AppColors.HINT_TEXTFEILD_COLOR,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26),
                      borderSide: BorderSide(
                        color: AppColors.HINT_TEXTFEILD_COLOR,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: provider.allNews.length,
                    itemBuilder: (context, index) {
                      return LazyLoadingList(
                        initialSizeOfItems: 5,
                        index: index,
                        // child: buildItem(),
                        loadMore: () => print('Loading More'),
                        hasMore: true,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsNewsScreen(Provider.of<NewsProvider>(context,
                                      listen: false)
                                      .allNews[index]),
                                ));
                          },
                          child: Card(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(Provider.of<NewsProvider>(context,
                                            listen: false)
                                        .allNews[index]
                                        .postDate),
                                    Spacer(),
                                    ElevatedButton(
                                      onPressed: () {
                                        Share.share(
                                            Provider.of<NewsProvider>(context, listen: false).allNews[index].guid);
                                        print(Provider.of<NewsProvider>(context,
                                                listen: false)
                                            .allNews[index]
                                            .guid);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        onPrimary: Colors.white,
                                        elevation: 0,
                                      ),
                                      child: Icon(
                                        Icons.share,
                                        color: Colors.red.shade900,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.network(
                                  Provider.of<NewsProvider>(context,
                                          listen: false)
                                      .allNews[index]
                                      .imageUrl,
                                  fit: BoxFit.fitWidth,
                                  width: double.infinity,
                                  height: 170,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                      Provider.of<NewsProvider>(context,
                                              listen: false)
                                          .allNews[index]
                                          .postTitle,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ]),
          );
        }
      }),
    );
  }

}

