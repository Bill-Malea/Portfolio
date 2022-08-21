// @dart=2.9
import 'package:flutter/material.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/providers/api_provider.dart';
import 'package:portfolio/widgets/theme_inherited_widget.dart';
import 'package:provider/provider.dart';
import 'config/themes.dart';
import 'providers/projectsprovider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ThemeSwitcherWidget(
      initialDarkModeOn: false,
      child: MainClass(),
    );
  }
}

class MainClass extends StatelessWidget {
  const MainClass({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bill Malea',
        theme: ThemeSwitcher.of(context).isDarkModeOn
            ? darkTheme(context)
            : lightTheme(context),
        home: MultiProvider(providers: [
          ChangeNotifierProvider(
            create: (context) => Navigations(),
          ),
          ChangeNotifierProvider(
            create: (context) => Projectsprovider(),
          ),
       
        ], child: FutureBuilder(
          future:   Projectsprovider().loadprojects(),
          builder: ((context, snapshot) {
          if(snapshot.hasData){
            return const HomePage(loading: false,);
          }else if(snapshot.hasError){
           
          }

return  const HomePage(loading: true,);



        }),) ));
  }
}
