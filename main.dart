import 'package:bloc_pattern/bloc_pattern.dart';
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
      dependencies: const[],
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 25, 0, 0,),
      child: Column(
        children: <Widget>[
          const CustomAppBar(),
          const SizedBox(height: 30,),
          title(),
          const SizedBox(height: 30,),
          searchBar(),
        ],
      ),
      );
  }

  Widget title(){
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 45,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Food',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            Text(
              'Delivery',
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 30,
              ),
            )
          ],
        )
      ],

    );
  }

  Widget searchBar() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:<Widget>[
        Icon(
          Icons.search,
          color: Colors.black45,
        ),
        SizedBox(width: 20,),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search...",
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              hintStyle: TextStyle(
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
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
          GestureDetector(
            onTap: (){},
            child: Container(
              margin: const EdgeInsets.only(right: 30),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.yellow[800],
                borderRadius: BorderRadius.circular(50),
             
              ),
              child: const Text('0'),
            ),
          ),

        
      ]),

    );
  }
}

