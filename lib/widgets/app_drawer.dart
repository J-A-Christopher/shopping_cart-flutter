import 'package:flutter/material.dart';
import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';
import '../helpers/custom_route.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Hello Friend'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.shop),
              title: const Text('Shop'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.payment),
              title: const Text('Orders'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(OrdersScreen.routeName);
              }),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Manage Products'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(UserProductsScreen.routeName);
              }),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              onTap: () {
                Navigator.of(context).pop();
                //Navigator.pushReplacementNamed(context, '/');
                Navigator.pushNamed(
                    context,
                    CustomRoute(
                        builder: (context) => const OrdersScreen(),
                        settings: const RouteSettings()) as String);
                // Navigator.of(context)
                //     .pushReplacementNamed(UserProductsScreen.routeName);

                Provider.of<Auth>(context, listen: false).logOut();
              }),
        ],
      ),
    );
  }
}
