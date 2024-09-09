import 'package:countries/core/navigator_key.dart';
import 'package:countries/core/routes.dart';
import 'package:countries/features/countries/presentation/manager/bloc/country_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main()  async{
   WidgetsFlutterBinding.ensureInitialized();
   await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}
final storage = new FlutterSecureStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
              BlocProvider(create: (context) => CountryBloc()),
         
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

