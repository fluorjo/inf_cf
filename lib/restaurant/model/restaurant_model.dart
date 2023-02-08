import 'package:inf_cf/common/const/data.dart';

enum RestaurantPriceRange {
  expensive,
  medium,
  cheap,
}

class RestaurantModel {
  final String id;
  final String name;
  final String thumbUrl;
  final List<String> tags;
  final RestaurantPriceRange priceRange;
  final int ratingsCount;
  final double ratings;
  final int deliveryTime;
  final int deliveryFee;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.thumbUrl,
    required this.tags,
    required this.priceRange,
    required this.ratingsCount,
    required this.ratings,
    required this.deliveryTime,
    required this.deliveryFee,
  });

  factory RestaurantModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return RestaurantModel(
                      id: json['id'],
                      name: json['name'],
                      thumbUrl: 'http://$ip${json['thumbUrl']}',
                      tags: List<String>.from(json['tags']),
                      priceRange: RestaurantPriceRange.values
                          .firstWhere((e) => e.name == json['priceRange']),
                      ratingsCount: json['ratingsCount'],
                      ratings: json['ratings'],
                      deliveryTime: json['deliveryTime'],
                      deliveryFee: json['deliveryFee'],);
  }
}
