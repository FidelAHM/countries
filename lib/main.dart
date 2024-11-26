import 'package:countries/core/navigator_key.dart';
import 'package:countries/core/routes.dart';
import 'package:countries/features/countries/presentation/Manager_blog/bloc/blog_bloc.dart';
import 'package:countries/features/countries/presentation/manager/bloc/country_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
    orientation: AppOpenAd.orientationPortrait
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await MobileAds.instance.initialize();
  await loadAd();
  runApp(const MyApp());
}

final storage = new FlutterSecureStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => CountryBloc()),
            BlocProvider(create: (context) => BlogBloc()),
          ],
          child: MaterialApp(
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splashScreen,
            routes: AppRoutes.routes,
          ),
        );
      },
    );
  }
}
