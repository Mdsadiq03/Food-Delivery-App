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
      ],
      child:const MaterialApp(
      title: 'Food Delivery',
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
    );
  }
}

class Home extends StatelessWidget{
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: const <Widget>[
              FirstHalf(),
            ],
          ),
        ),
        ),

    );
}
}

class FirstHalf extends StatelessWidget{
  const FirstHalf({super.key});


  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(35, 25, 0, 0,),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
        ],
      ),
      );
  }
}

class CustomAppBar extends StatelessWidget{
  const CustomAppBar({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:<Widget>[
          const Icon(Icons.menu),
          Container(
            margin: const EdgeInsets.only(right: 30),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.yellow[800],
              borderRadius: BorderRadius.circular(50),
           
            ),
            child: const Text('0'),
          ),

        
      ]),

    );
  }
}

