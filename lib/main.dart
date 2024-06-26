import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/bloc/cartListBloc.dart';
import 'package:food_delivery/bloc/listStyleColorBloc.dart';
import 'package:food_delivery/cart.dart';
import 'package:food_delivery/model/fooditem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => CartListBloc()),
        Bloc((i) => ColorBloc()),
      ],
      dependencies: const [],
      child: const MaterialApp(
        title: 'Food Delivery',
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              FirstHalf(),
              SizedBox(
                height: 45,
              ),
              for (var foodItem in fooditemList.foodItems)
                ItemContainer(foodItem: foodItem)
            ],
          ),
        ),
      ),
    );
  }
}

class ItemContainer extends StatelessWidget {
  ItemContainer({super.key, required this.foodItem});

  final FoodItem foodItem;

  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  addToCart(FoodItem foodItem) {
    bloc.addToList(foodItem);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart(foodItem);

        final snackbar = SnackBar(
          content: Text("${foodItem.title} added to the cart"),
          duration: Duration(milliseconds: 1000),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
      child: Items(
        hotel: foodItem.hotel,
        itemName: foodItem.title,
        itemPrice: foodItem.price,
        imgUrl: foodItem.imgUrl,
        leftAligned: (foodItem.id % 2 == 0) ? true : false,
      ),
    );
  }
}

class Items extends StatelessWidget {
  const Items({
    super.key,
    required this.leftAligned,
    required this.imgUrl,
    required this.hotel,
    required this.itemName,
    required this.itemPrice,
  });

  final bool leftAligned;
  final String imgUrl;
  final String itemName;
  final double itemPrice;
  final String hotel;

  @override
  Widget build(BuildContext context) {
    double containerPadding = 45;
    double containerBorderRadius = 10;

    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: leftAligned ? 0 : containerPadding,
            right: leftAligned ? containerPadding : 0,
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: leftAligned
                        ? Radius.circular(0)
                        : Radius.circular(containerBorderRadius),
                    right: leftAligned
                        ? Radius.circular(containerBorderRadius)
                        : Radius.circular(0),
                  ),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: leftAligned ? 20 : 0,
                  right: leftAligned ? 0 : 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            itemName,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Text(
                          "\$ $itemPrice",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ],

                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                            children: [
                              TextSpan(
                                text: "by",
                              ),
                              TextSpan(
                                text: hotel,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FirstHalf extends StatelessWidget {
  const FirstHalf({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        35,
        25,
        0,
        0,
      ),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          const SizedBox(
            height: 30,
          ),
          title(),
          const SizedBox(
            height: 30,
          ),
          searchBar(),
          const SizedBox(
            height: 45,
          ),
          categories(),
        ],
      ),
    );
  }

  Widget title() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 45,
        ),
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
      children: <Widget>[
        Icon(
          Icons.search,
          color: Colors.black45,
        ),
        SizedBox(
          width: 20,
        ),
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

  Widget categories() {
    return Container(
      height: 185,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Burgers",
            availability: 12,
            selected: true,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Pizza",
            availability: 9,
            selected: false,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "Rolls",
            availability: 15,
            selected: false,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "wings",
            availability: 8,
            selected: false,
          ),
          CategoryListItem(
            categoryIcon: Icons.bug_report,
            categoryName: "pasta",
            availability: 10,
            selected: false,
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key});

  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Icon(Icons.menu),
            StreamBuilder(
              stream: bloc.listStream,
              builder: (context, snapshot) {
                List<FoodItem> foodItems = snapshot.data ?? [];

                
                int length = foodItems.length;

                return buildGestureDetector(length, context, foodItems);
              },
            ),
          ]),
    );
  }

  GestureDetector buildGestureDetector(
      int length, BuildContext context, List<FoodItem> foodItems) {
    return GestureDetector(
      onTap: () {
        if (length > 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Cart(),
            ),
          );
        } else {
          return;
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 30),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.yellow[800],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text("Cart ${length.toString()}"),
      ),
    );
  }
}

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key,
    required this.categoryIcon,
    required this.categoryName,
    required this.availability,
    required this.selected,
  });

  final IconData categoryIcon;
  final String categoryName;
  final int availability;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        
          borderRadius: BorderRadius.circular(50),
          color: selected ? Color(0xfffeb324) : Colors.white,
          border: Border.all(
            color: selected
                ? Color.fromARGB(26, 78, 74, 74)
                : Color.fromARGB(255, 223, 219, 219),
            width: 1.5,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(24, 167, 161, 161),
              blurRadius: 15,
              offset: Offset(25, 0),
              spreadRadius: 5,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: selected ? Colors.transparent : Colors.grey,
                width: 1.5,
              ),
            ),
            child: Icon(
              categoryIcon,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            categoryName,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            width: 1.5,
            height: 15,
          ),
          Text(
            availability.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
