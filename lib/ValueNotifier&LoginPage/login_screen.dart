import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/ValueNotifier&LoginPage/auth_provider.dart';

import 'home_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void _navigateToHomeScreen() {
    Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context,listen: false);
    ValueNotifier<bool> obscureValue = ValueNotifier<bool>(false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome",style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold), ),
              SizedBox(height: 40,),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "eve.holt@reqres.in",
                  label: Text("Email"),
                ),

              ),
              SizedBox(height: 10,),
              ValueListenableBuilder(
                  valueListenable: obscureValue,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: passwordController,
                      obscureText: obscureValue.value,
                      decoration: InputDecoration(
                        hintText: "cityslicka",
                        label: Text("password"),
                        suffixIcon: InkWell(
                            onTap: (){
                              obscureValue.value = !obscureValue.value;
                            },
                            child: obscureValue.value?Icon(Icons.visibility_off):Icon(Icons.visibility)
                        ),
                      ),
                    );
                  },
              ),
              SizedBox(height: 30,),
              InkWell(
                onTap: ()async{
                  await authProvider.Login(emailController.text, passwordController.text);
                  if(!authProvider.isloading){
                    if(authProvider.isLogin){
                      _navigateToHomeScreen();
                    }
                  }
                },
                child: Container(
                  child: Consumer(
                    builder: (context, value, child) {
                      return Center(
                        child: authProvider.isloading?CircularProgressIndicator(color: Colors.white,)
                            :Text("Log in " , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      );
                    },
                  ),
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.red.shade400,
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
