import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/MultipleProviderExample/Provider/slider_provider.dart';
import 'package:provider_tutorials/MultipleProviderExample/example2_slider_home_screen.dart';
import 'package:provider_tutorials/ProviderExample1/Provider/count_provider.dart';
import 'package:provider_tutorials/ProviderExample1/provider_home_screen.dart';

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
        ChangeNotifierProvider(create: (_)=> SliderProvider())
      ],
        child: const MaterialApp(
          home: Example2SliderHomeScreen(),
        )
    );
  }
}
