import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'restaurant_provider.dart';

class RestaurantList extends ConsumerStatefulWidget {
  const RestaurantList({Key? key}) : super(key: key);

  @override
  _RestaurantListState createState() => _RestaurantListState();
}

class _RestaurantListState extends ConsumerState<RestaurantList> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    // 初始化时绑定初始状态
    searchController = TextEditingController(text: ref.read(searchProvider));

    // 监听 TextEditingController 的变化并更新状态
    searchController.addListener(() {
      ref.read(searchProvider.notifier).state = searchController.text;
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final restaurants = ref.watch(filteredRestaurantProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Restaurants')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: restaurants.when(
              data: (data) => ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index].name),
                    subtitle: Text(data[index].cuisine),
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
          ),
        ],
      ),
    );
  }
}
