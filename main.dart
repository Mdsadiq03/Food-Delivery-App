import 'package:flutter/material.dart';
import 'package:food_delivery/bloc/cartListBloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => CartListBloc())
      ]
      child:const MaterialApp(
      title: 'Food Delivery',
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
    );
  }
}

class Home extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              FirstHalf(),
            ],
          ),
        ),
        ),

    );
}
}

class FirstHalf extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(35, 25, 0, 0,),
      child: Column(
        children: <Widget>[
          CustomAppBar();
        ],
      ),
      );
  }
}

