FooditemList fooditemList = FooditemList(foodItems: [
  FoodItem(
    id: 1,
    title: "Beach BBQ Burger",
    hotel: "Las Vegas Hotel",
    price: 7.45,
    imgUrl:
        "https://hips.hearstapps.com/pop.h-cdn.co/assets/cm/15/05/480x240/54ca71fb94ad3_-_5summer_skills_burger_470_0808-de.jpg",
  ),
  FoodItem(
    id: 2,
    title: "Kick Ass Burgers",
    hotel: "Dudleys",
    price: 6.87,
    imgUrl:
        "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png",
  ),
  FoodItem(
    id: 3,
    title: "Supreme Pizza Burger",
    hotel: "Golf Course",
    price: 8.49,
    imgUrl: "https://recipeland.com/rails/active_storage/representations/proxy/eyJfcmFpbHMiOnsiZGF0YSI6MTkwODksInB1ciI6ImJsb2JfaWQifX0=--78f510c6c5539960dfa362c0a9268517efd35e3a/eyJfcmFpbHMiOnsiZGF0YSI6eyJmb3JtYXQiOiJqcGciLCJyZXNpemVfdG9fbGltaXQiOls4NjAsbnVsbF0sImNvbnZlcnQiOiJ3ZWJwIiwic2F2ZXIiOnsic3Vic2FtcGxlX21vZGUiOiJvbiIsInN0cmlwIjpmYWxzZSwiaW50ZXJsYWNlIjp0cnVlLCJxdWFsaXR5Ijo1MH19LCJwdXIiOiJ2YXJpYXRpb24ifX0=--4288720e597eeb129da100809b95192d1d38cc9d/orig_1167b0d62114aa73bc34.jpg",
  ),
  FoodItem(
    id: 4,
    title: "Chilly Cheeze Burger",
    hotel: "Las Vegas Hotel",
    price: 5.34,
    imgUrl: "https://livingbbq.de/wp-content/uploads/2022/06/Chili-Cheese-Burger-1-von-1.jpg"
  ),
  FoodItem(
    id: 5,
    title: "Double Decker Burger",
    hotel: "Las Vegas Hotel",
    price: 8.11,
    imgUrl: "https://i.ytimg.com/vi/l2hJnUtmuvs/maxresdefault.jpg",
  ),
  FoodItem(
    id: 6,
    title: "Veg Nugget Burger",
    hotel: "Las Vegas Hotel",
    price: 6.55,
    imgUrl:
        "https://cdn.pixabay.com/photo/2018/03/04/20/08/burger-3199088__340.jpg",
  ),
]);

class FooditemList{
  FooditemList({required this.foodItems});

  List<FoodItem> foodItems;
}


class FoodItem{
  FoodItem({
    required this.id,
    required this.title,
    required this.hotel,
    required this.price,
    required this.imgUrl,

    this.quantity = 1,
  });

  int id;
  String title;
  String hotel;
  double price;
  String imgUrl;
  int quantity;

  void incrementQuantity(){
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity(){
    this.quantity = this.quantity - 1;
  }

  
}