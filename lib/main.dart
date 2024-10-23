import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app_api/controller/details_screen_controller.dart';
import 'package:news_app_api/controller/hive_controller.dart';
import 'package:news_app_api/controller/search_screen_controller.dart';
import 'package:news_app_api/controller/top_trending_controller.dart';
import 'package:news_app_api/model/bookmark_model.dart';
import 'package:news_app_api/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BookmarkModelAdapter());
  var savedBox = await Hive.openBox<BookmarkModel>('SavedBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchScreenController(),
        ),
        ChangeNotifierProvider(create: (context) => TopTrendingController()),
        ChangeNotifierProvider(
          create: (context) => DetailsScreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HiveController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
