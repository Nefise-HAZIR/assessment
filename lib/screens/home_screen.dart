import 'package:assessment/screens/card_puan.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              CardPuan(name: 'Nefise',),
              SizedBox(height: 10,),
              CardPuan(name: 'Seda',),
              SizedBox(height: 10,),
              CardPuan(name: 'Berkant',),
              SizedBox(height: 10,),
              CardPuan(name: 'Beyza',),
              SizedBox(height: 10,),
              CardPuan(name: 'Ayşenur',),
              SizedBox(height: 10,),
              CardPuan(name: 'Meryem Buse',),
              SizedBox(height: 10,),
              CardPuan(name: 'Yağız',),
              SizedBox(height: 10,),
              CardPuan(name: 'Cemre',),
              SizedBox(height: 10,),
              CardPuan(name: 'Berfin',),
              SizedBox(height: 10,),
              CardPuan(name: 'Nilüfer',),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
