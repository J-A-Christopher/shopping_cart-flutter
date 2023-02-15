import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';
import '../widgets/203 badge.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import '../widgets/app_drawer.dart';

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
            ),
            Consumer<Cart>(
              builder: (_, cart, ch) => Badgee(
                  value: cart.itemCount.toString(),
                  color: Theme.of(context).colorScheme.secondary,
                  child: ch!),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            )
          ],
        ),
        drawer: const AppDrawer(),
        body: ProductsGrid(
          _showOnlyFavorites,
        ));
  }
}
