import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/MultipleProviderExample/Provider/slider_provider.dart';

class Example2SliderHomeScreen extends StatefulWidget {
  const Example2SliderHomeScreen({super.key});

  @override
  State<Example2SliderHomeScreen> createState() => _Example2SliderHomeScreenState();
}

class _Example2SliderHomeScreenState extends State<Example2SliderHomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Slider Example"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<SliderProvider>(builder: (context,value,child){
              return Slider(
                  value: value.value ,
                  min: 0,
                  max: 1,
                  onChanged: (val){
                    value.setValue(val);

                  });
            }),
            Consumer<SliderProvider>(builder: (context,value,child){
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent.withOpacity(value.value)
                        ),
                        child: const Center(
                          child: Text("Container1"),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent.withOpacity(value.value)
                        ),
                        child: const Center(
                          child: Text("Container2"),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),


          ],
        ),
      ),
    );
  }
}
