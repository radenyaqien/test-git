import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testgit/data/remote/api_service.dart';
import 'package:testgit/provider/restaurants_provider.dart';
import 'package:testgit/ui/restaurant_list.dart';
import 'package:testgit/ui/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantsProvider>(
      create: (context) => RestaurantsProvider(apiService: ApiService()),
      child: const HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant Menu"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
        ],
      ),
      body: const RestaurantListPage(),
    );
  }
}
