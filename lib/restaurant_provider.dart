import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'restaurant_model.dart';

final searchProvider = StateProvider<String>((ref) => '');

final restaurantProvider = FutureProvider<List<Restaurant>>((ref) async {
  final String response =
      await rootBundle.loadString('assets/restaurants.json');
  final List<dynamic> data = json.decode(response);
  return data.map((json) => Restaurant.fromJson(json)).toList();
});

final filteredRestaurantProvider =
    Provider<AsyncValue<List<Restaurant>>>((ref) {
  final search = ref.watch(searchProvider);
  final restaurants = ref.watch(restaurantProvider);

  return restaurants.whenData(
    (restaurantList) => restaurantList
        .where((restaurant) =>
            restaurant.name.toLowerCase().contains(search.toLowerCase()))
        .toList(),
  );
});
