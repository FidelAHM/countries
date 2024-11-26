import 'package:any_link_preview/any_link_preview.dart';
import 'package:countries/core/utils/padding.dart';
import 'package:countries/core/utils/sizedbox.dart';
import 'package:countries/core/utils/theme.dart';
import 'package:countries/core/widget/appbar/custom_appbar.dart';
import 'package:countries/features/countries/presentation/Manager_blog/bloc/blog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  AppOpenAd? openAd;

  Future<void> loadAd() async {
    await AppOpenAd.load(
      adUnitId: 'ca-app-pub-5875348340275969/7330044347',
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad) {
        print('Ad is loaded');
        openAd = ad;
        openAd!.show();
      }, onAdFailedToLoad: (error) {
        print('Ad error $error');
      }),
      orientation: AppOpenAd.orientationPortrait,
    );
  }

  void showAd() {
    if (openAd == null) {
      print('trying to show before loading');
      loadAd();
      return;
    }
    openAd!.fullScreenContentCallback ==
        FullScreenContentCallback(onAdShowedFullScreenContent: (ad) {
          print('onAdShowedFullScreenContent');
        }, onAdFailedToShowFullScreenContent: (ad, error) {
          print('failed');
          openAd = null;

          loadAd();
        }, onAdDismissedFullScreenContent: (ad) {
          print('dismissed');
          openAd = null;
          loadAd();
        });
    openAd!.show();
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(LoadBlogsEvent());
    loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(
          title: 'Blogs',
          leading: IconButton(
            icon: Icon(Icons.home, color: AppColors.whiteA700),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: XPadding.allSidePadding5,
          child: Column(
            children: [
              BlocBuilder<BlogBloc, BlogState>(
                builder: (context, state) {
                  if (state is BlogDataLoadedState) {
                    final blogsToDisplay = state.blogs;

                    return Column(
                      children: [
                        XGapHeight.h10,
                        Container(
                          height: 600.h,
                          child: ListView.builder(
                            itemCount: blogsToDisplay.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final blogs = blogsToDisplay[index];

                              return Padding(
                                padding: XPadding.allSidePadding5,
                                child: Card(
                                  color: AppColors.gray50,
                                  elevation: 0,
                                  child: AnyLinkPreview(
                                    link: blogs.url,
                                    displayDirection:
                                        UIDirection.uiDirectionHorizontal,
                                    cache: Duration(hours: 1),
                                    backgroundColor: AppColors.gray100,
                                    errorWidget: Container(
                                      color: AppColors.gray100,
                                      child: Text('Oops!'),
                                    ),
                                    // onTap: () {
                                    //   showAd();
                                    // },
                                  ),
                                ),
                              );
                            },
                            scrollDirection: Axis.vertical,
                            padding: XPadding.onlyBottom10,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Shimmer.fromColors(
                      baseColor: AppColors.lightGrey,
                      highlightColor: AppColors.lightBlue100,
                      child: Padding(
                        padding: XPadding.allSidePadding,
                        child: Container(
                          height: 50.h,
                          width: 300.w,
                          color: AppColors.lightBlue,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
