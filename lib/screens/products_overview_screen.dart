import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProdutsOverviewScreen extends StatefulWidget {
  const ProdutsOverviewScreen({super.key});

  @override
  State<ProdutsOverviewScreen> createState() => _ProdutsOverviewScreenState();
}

class _ProdutsOverviewScreenState extends State<ProdutsOverviewScreen> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Shop'),
          actions: [
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              itemBuilder: (ctx) => [
                const PopupMenuItem(
                  value: FilterOptions.Favorites,
                  child: Text('Only Favourites'),
                ),
                const PopupMenuItem(
                  value: FilterOptions.All,
                  child: Text('Show All'),
                )
              ],
              icon: const Icon(Icons.more_vert),
            )
          ],
        ),
        body: ProductsGrid(
          _showOnlyFavorites,
        ));
  }
}