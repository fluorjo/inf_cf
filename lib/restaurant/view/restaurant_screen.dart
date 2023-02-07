import 'package:flutter/material.dart';
import 'package:inf_cf/restaurant/component/restaurant_card.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Padding(

        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: RestaurantCard(
            image: Image.asset(
              'asset/img/food/ddeok_bok_gi.jpg',
              fit:BoxFit.cover,
              //전체를 커버
            ),
            name: '불타는 떡볶이',
            tags: ['떡복이','치즈','매운맛'],
            ratingCount: 100,
            rating: 4.52,
            deliveryTime: 15,
            deliveryFee: 2000),
      ),
    ));
  }
}