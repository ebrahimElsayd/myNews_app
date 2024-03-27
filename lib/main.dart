import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_news_c10_sun3/home/category/category_details.dart';
import 'package:flutter_app_news_c10_sun3/home/home_screen.dart';
import 'package:flutter_app_news_c10_sun3/my_theme.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'my_bloc_observer.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  final documentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),

      },
      theme: MyTheme.lightTheme,
    );
  }
}
