import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/bloc/cartListBloc.dart';
import 'package:food_delivery/model/fooditem.dart';

class Cart extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    List<FoodItem> foodItems;

    return StreamBuilder(
      stream: bloc.listStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          foodItems = snapshot.data!;
        }
        return Scaffold(
          body: SafeArea(
            child: Container(
              child: CartBody(foodItems),
            ),
          ),
        );
      },
    );
  }
}

class CartBody extends StatelessWidget {
  final List<FoodItem> foodItems;

  CartBody(this.foodItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(35, 40, 25, 0),
      child: Column(children: [
        CustomAppBar(),
        title(),
        Expanded(flex: 1,child:foodItems.length > 0 ? foodItemList() : noItemContainer() ,),
      ]),
    );
  }

  

class CustomAppBar extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5),
          child: GestureDetector(
            child: Icon(
              CupertinoIcons.back,
              size: 30,
            ),
            onTap: () {
              Navigator..pop(context);
            },
          ),
        ),
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Icon(
              CupertinoIcons.delete,
              size: 35,
            ),
            
          ),
          onTap: (){},
        ),
      ],
    );
  }
}
