import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/FavouriteApp/Fav_home_screen.dart';
import 'package:provider_tutorials/LightandDarkTheme/dark_light_system_theme_screen.dart';
import 'package:provider_tutorials/LightandDarkTheme/theme_changer_provider.dart';
import 'package:provider_tutorials/MultipleProviderExample/Provider/slider_provider.dart';
import 'package:provider_tutorials/MultipleProviderExample/example2_slider_home_screen.dart';
import 'package:provider_tutorials/ProviderExample1/Provider/count_provider.dart';
import 'package:provider_tutorials/ProviderExample1/provider_home_screen.dart';
import 'package:provider_tutorials/ValueNotifier&LoginPage/auth_provider.dart';
import 'package:provider_tutorials/ValueNotifier&LoginPage/login_screen.dart';

import 'FavouriteApp/fav_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> CountProvider(),),
        ChangeNotifierProvider(create: (_)=> SliderProvider()),
        ChangeNotifierProvider(create: (_)=> FavProvider()),
        ChangeNotifierProvider(create: (_)=> ThemeChangerProvider()),
        ChangeNotifierProvider(create: (_)=> AuthProvider()),
      ],
        child:  Builder(
          builder: (BuildContext context) {
            final themeProvider = Provider.of<ThemeChangerProvider>(context);
            return MaterialApp(
              themeMode: themeProvider.themeMode,
              theme: ThemeData(
                primarySwatch: Colors.red,
                brightness: Brightness.light,
                iconTheme: IconThemeData(color: Colors.red)
              ),
              darkTheme: ThemeData(
                primarySwatch: Colors.teal,
                brightness: Brightness.dark,
                  iconTheme: IconThemeData(color: Colors.white)
              ),
              home: LoginScreen(),
            );

          },

        )
    );
  }
}
