import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/ProviderExample1/Provider/count_provider.dart';

class ProviderHomeScreen extends StatefulWidget {
  const ProviderHomeScreen({super.key});

  @override
  State<ProviderHomeScreen> createState() => _ProviderHomeScreenState();
}

class _ProviderHomeScreenState extends State<ProviderHomeScreen> {
  int count=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final countProvider = Provider.of<CountProvider>(context , listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }
  @override
  Widget build(BuildContext context)  {
    final countProvider = Provider.of<CountProvider>(context , listen: false);
    return  Scaffold(
      appBar: AppBar(
        title: Text("Provider Example"),
        centerTitle: true,
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<CountProvider>(builder: (context,value,child){
            return Center(child: Text("Count : " + countProvider.count.toString(),
                style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold)),
            );
          }),
          Center(
            child: Text("Time "+DateTime.now().hour.toString()
                    +" : "+DateTime.now().minute.toString()
                    +" : "+DateTime.now().second.toString() ,
              style: TextStyle(fontSize: 40),
            )  ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
    
  }
}

